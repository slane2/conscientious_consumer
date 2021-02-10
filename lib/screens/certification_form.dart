import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/certification.dart';
import '../shared/constants.dart';

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
  bool conflict;
}

class CertificationForm extends StatefulWidget {
  @override
  _CertificationFormState createState() => _CertificationFormState();
}

class _CertificationFormState extends State<CertificationForm> {
  final formKey = GlobalKey<FormState>();
  final Certification = CertificationFields();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('Certifications').snapshots(),
        builder: (content, snapshot) {
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
                            Certification.name = value;
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
                            Certification.description = value;
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
                            Certification.logo = value;
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
                            Certification.source_url = value;
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
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Criteria'),
                          onSaved: (value) {
                            Certification.criteria = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a brief description of the criteria for this certification';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: 10),
                      RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              // formKey.currentState.save();
                              // Navigator.of(context).pop();
                              FirebaseFirestore.instance
                                  .collection('Certifications')
                                  .add({
                                'name': Certification.name,
                                'description': Certification.description,
                                'source_name': Certification.logo,
                                'source_url': Certification.source_url,
                                'year': Certification.criteria
                              });
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
