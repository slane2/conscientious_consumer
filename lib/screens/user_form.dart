import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/bill.dart';


class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  // final AuthService _auth = AuthService();
  String email = '';
  String password = '';
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
                // TextFormField(
                //     autofocus: true,
                //     decoration: InputDecoration(
                //         labelText: 'Name', border: OutlineInputBorder()),
                //     onChanged: (val) {
                //       setState(() => name = val);

                //     },
                //     validator: (val) {
                //       if (val.isEmpty) {
                //         return 'Please enter your first and last name';
                //       } else {
                //         return null;
                //       }
                //     }),
                TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    }),
                TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: 10),
                RaisedButton(
                    onPressed: () async {
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
