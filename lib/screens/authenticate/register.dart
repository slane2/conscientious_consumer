import 'package:flutter/material.dart';
import 'sign_in.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  //keeps track of the state of the form
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, title: Text('Sign Up'), actions: <Widget>[
        FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            })
      ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.tealAccent[400],
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.teal[800]),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() =>
                        error = 'Please supply a valid email');
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              )
            ]),
          )),
    );
  }
}
