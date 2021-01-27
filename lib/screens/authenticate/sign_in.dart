import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'authenticate.dart';

import 'package:flutter/material.dart';
import 'package:the_conscientious_consumer/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, title: Text('Sign In'), actions: <Widget>[
        FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign Up'),
            onPressed: () {
              widget.toggleView();
            })
      ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.tealAccent[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.teal[800]),
                  ),
                  onPressed: () async {
                    print(email);
                    print('Signed In');
                  })
            ]),
          )),
    );
  }
}
