import 'package:flutter/material.dart';
import '../user_form.dart';
import '../form_hub.dart';
import '../bills.dart';
import '../../services/auth.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("The Conscientious Consumer"), actions: <Widget>[
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
