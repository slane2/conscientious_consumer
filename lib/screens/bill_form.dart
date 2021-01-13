import 'package:flutter/material.dart';
import '../models/bill.dart';

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
                  decoration: InputDecoration(
                      labelText: 'Bill Name', border: OutlineInputBorder()),
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
                    decoration: InputDecoration(
                        labelText: 'Bill Description',
                        border: OutlineInputBorder()),
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
                    decoration: InputDecoration(
                        labelText: 'Name of Source (eg Congress.gov)',
                        border: OutlineInputBorder()),
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
                    decoration: InputDecoration(
                        labelText: 'URL of Source',
                        border: OutlineInputBorder()),
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
                    decoration: InputDecoration(
                        labelText: 'Year(s)', border: OutlineInputBorder()),
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
                    decoration: InputDecoration(
                        labelText: 'Was the bill passed',
                        border: OutlineInputBorder()),
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
                RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Save Entry'))
              ],
            ),
          )),
    );
  }
}
