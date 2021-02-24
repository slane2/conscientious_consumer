import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/certification.dart';
import '../../shared/constants.dart';
import '../list_views/certifications.dart';

class CertificationFields {
  String name;
  String description;
  String logo;
  String source_url;
  String criteria;
  bool promise;
  bool questionairre;
  bool audit;
  bool transparent;
  bool conflict_free;
}

class CertificationForm extends StatefulWidget {
  @override
  _CertificationFormState createState() => _CertificationFormState();
}

class _CertificationFormState extends State<CertificationForm> {
  final formKey = GlobalKey<FormState>();
  final certification = CertificationFields();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('certifications').snapshots(),
        builder: (context, snapshot) {
          return Material(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Certification Name'),
                          onSaved: (value) {
                            certification.name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the name of the Certification';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Description'),
                          onSaved: (value) {
                            certification.description = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a description of the Certification';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'URL of the Certification Logo'),
                          onSaved: (value) {
                            certification.logo = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the URL of the Certification Logo';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Source URL'),
                          onSaved: (value) {
                            certification.source_url = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the URL of the source';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Criteria'),
                          onSaved: (value) {
                            certification.criteria = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a brief description of the criteria for this certification';
                            } else {
                              return null;
                            }
                          }),
                      Text('Certification Requirements'),
                      ListTile(
                        title: const Text('Promise'),
                        leading: Radio(
                          value: true,
                          groupValue: certification.promise,
                          onChanged: ( value) {
                            setState(() {
                              certification.promise = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Questionairre'),
                        leading: Radio(
                          value: true,
                          groupValue: certification.questionairre,
                          onChanged: ( value) {
                            setState(() {
                              certification.questionairre = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Audit'),
                        leading: Radio(
                          value: true,
                          groupValue: certification.audit,
                          onChanged: ( value) {
                            setState(() {
                              certification.audit = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Transparent'),
                        leading: Radio(
                          value: true,
                          groupValue: certification.transparent,
                          onChanged: ( value) {
                            setState(() {
                              certification.transparent = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Conflict Free'),
                        leading: Radio(
                          value: true,
                          groupValue: certification.conflict_free,
                          onChanged: ( value) {
                            setState(() {
                              certification.conflict_free = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              await FirebaseFirestore.instance
                                  .collection('certifications')
                                  .add({
                                'name': certification.name,
                                'description': certification.description,
                                'source_name': certification.logo,
                                'source_url': certification.source_url,
                                'promise': certification.promise
                              });
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Certifications()));
                            }
                          },
                          child: Text('Save Entry')),
                      ElevatedButton(
                        child: Text('Back'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
