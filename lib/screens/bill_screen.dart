import 'package:flutter/material.dart';
import 'list_views/bills.dart';
import 'form_hub.dart';
import 'user_form.dart';
import '../services/auth.dart';

class BillScreen extends StatefulWidget {
  @override
  _BillScreenState createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bill Name"), actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ]),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('Shayla Lane'),
                accountEmail: new Text('test@test.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new AssetImage('assets/redhair.jpg'),
                ),
              ),
              new ListTile(
                  title: Text('Submit Data'),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new FormHub()));
                  }),
              new ListTile(
                  title: Text('Bills'),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Bills()));
                  }),
              new ListTile(
                  title: Text('Login'),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new UserForm()));
                  }),
            ],
          ),
        ),
        body: Center(child: Column()));
  }
}
