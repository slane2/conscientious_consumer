import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../models/company.dart';
import '../../shared/constants.dart';
import '../list_views/companies.dart';

var all_certs = [
  'Leaping Bunny',
  'Cruelty Free PETA',
  'Cradle to Cradle',
  'Made in a country where animal testing is illegal.',
  'Equal Salary Certified'
];

class CompanyFields {
  String name;
  String description;
  String logo;
  String parent;
  String address;
  String phone_number;
  String website;
  int rating;
  bool checked = false;
  List<String> certs = [];
}

class CompanyForm extends StatefulWidget {
  @override
  _CompanyFormState createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  final formKey = GlobalKey<FormState>();
  final company = CompanyFields();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('companies').snapshots(),
        builder: (context, snapshot) {
          return Material(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                            autofocus: true,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Company Name'),
                            onSaved: (value) {
                              company.name = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter the name of the company';
                              } else {
                                return null;
                              }
                            }),
                        TextFormField(
                            autofocus: true,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Description'),
                            onSaved: (value) {
                              company.description = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a description of the company';
                              } else {
                                return null;
                              }
                            }),
                        TextFormField(
                            autofocus: true,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'URL of the company Logo'),
                            onSaved: (value) {
                              company.logo = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter the URL of the company Logo';
                              } else {
                                return null;
                              }
                            }),
                        TextFormField(
                            autofocus: true,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Parent Company'),
                            onSaved: (value) {
                              company.parent = value;
                            }),
                        TextFormField(
                            autofocus: true,
                            decoration:
                                textInputDecoration.copyWith(hintText: 'website'),
                            onSaved: (value) {
                              company.website = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter the URL for this company\'s website';
                              } else {
                                return null;
                              }
                            }),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: all_certs.length,
                            itemBuilder: (context, index) {
                              var cert = all_certs[index];
                              return CheckboxListTile(
                                  title: Text("'$cert'"),
                                  secondary: Image.asset('./assets/planet.png'),
                                  value: company.checked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      company.checked = value;
                                      company.certs.add(all_certs[index]);
                                    });
                                  });
                            }),
                        SizedBox(height: 10),
                        RaisedButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                await FirebaseFirestore.instance
                                    .collection('companies')
                                    .add({
                                  'name': company.name,
                                  'description': company.description,
                                  'address': company.logo,
                                  'parent': company.parent,
                                  'website': company.website,
                                  'rating': company.rating,
                                  'checked': company.checked,
                                  'certs': company.certs
                                });
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Companies()));
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
                  ),
                )),
          );
        });
  }
}
