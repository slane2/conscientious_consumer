import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/bill.dart';
import '../../shared/constants.dart';
import '../list_views/bills.dart';

class BillFields {
  String name;
  String description;
  String source_name;
  String source_url;
  String year;
  String passed;
}

class BillForm extends StatefulWidget {
  @override
  _BillFormState createState() => _BillFormState();
}

class _BillFormState extends State<BillForm> {
  final formKey = GlobalKey<FormState>();

  final bill = BillFields();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bills').snapshots(),
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
                              hintText: 'Bill Name'),
                          onSaved: (value) {
                            bill.name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the name of the bill';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Description'),
                          onSaved: (value) {
                            bill.description = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a description of the bill';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Source Name'),
                          onSaved: (value) {
                            bill.source_name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the name of the source';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Source URL'),
                          onSaved: (value) {
                            bill.source_url = value;
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
                              textInputDecoration.copyWith(hintText: 'Year(s)'),
                          onSaved: (value) {
                            bill.year = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the year or years that the bill was considered';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          autofocus: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Did the Bill Pass?'),
                          onSaved: (value) {
                            bill.passed = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter whether the bill was passed';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              await FirebaseFirestore.instance
                                  .collection('bills')
                                  .add({
                                'name': bill.name,
                                'description': bill.description,
                                'source_name': bill.source_name,
                                'source_url': bill.source_url,
                                'year': bill.year,
                                'passed': bill.passed
                              });
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Bills()));
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
