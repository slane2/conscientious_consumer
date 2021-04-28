import 'package:flutter/material.dart';
import 'package:the_conscientious_consumer/models/company.dart';
import '../user_form.dart';
import '../form_hub.dart';
import '../list_views/bills.dart';
import '../../services/auth.dart';
import '../list_views/certifications.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  List<Company> companies = [
    Company(
        name: 'Tom\'s of Maine',
        description:
            'Tom\'s of Maine is a brand name and manufacturing company of personal care products with only natural ingredients and a majority-owned subsidiary of Colgate-Palmolive since 2006.',
        logo:
            'https://upload.wikimedia.org/wikipedia/en/4/49/Tom%27s_of_Maine_logo_2010.png'),
    Company(
        name: 'Toms of Maine',
        description:
            'Tom\'s of Maine is a brand name and manufacturing company of personal care products with only natural ingredients and a majority-owned subsidiary of Colgate-Palmolive since 2006.',
        logo:
            'https://upload.wikimedia.org/wikipedia/en/4/49/Tom%27s_of_Maine_logo_2010.png'),
    Company(
        name: 'Tom\'s of Maine',
        description:
            'Tom\'s of Maine is a brand name and manufacturing company of personal care products with only natural ingredients and a majority-owned subsidiary of Colgate-Palmolive since 2006.',
        logo:
            'https://upload.wikimedia.org/wikipedia/en/4/49/Tom%27s_of_Maine_logo_2010.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("The Conscientious Consumer"), actions: <Widget>[
        TextButton.icon(
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
          title: Text('Certifications'),
          onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new Certifications()));
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
        child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.blueAccent[700],
                        )),
                        padding: EdgeInsets.fromLTRB(5.0, 8.0, 320, 15.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent[700],
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(3),
                          child: FlatButton(
                            onPressed: () {},
                            color: Colors.transparent,
                            child: Text(
                              'Top  Companies',
                              style: TextStyle(height: 5, fontSize: 10),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: companies.map((company) {
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              company.name,
                              style: TextStyle(height: 2, fontSize: 10),
                            ),
                            Container(
                                child: Image.network(company.logo),
                                height: 80.0,
                                width: 80.0),
                            Container(
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/f/f2/Five_star_insignia.png',
                                    height: 5.0,
                                    width: 100.0)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(3),
                          child: FlatButton(
                            onPressed: () {},
                            color: Colors.transparent,
                            child: Text(
                              'Top  Certifications',
                              style: TextStyle(height: 5, fontSize: 10),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: companies.map((company) {
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              company.name,
                              style: TextStyle(height: 2, fontSize: 10),
                            ),
                            Container(
                                child: Image.network(company.logo),
                                height: 80.0,
                                width: 80.0),
                            Container(
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/f/f2/Five_star_insignia.png',
                                    height: 5.0,
                                    width: 100.0)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(3),
                          child: FlatButton(
                            onPressed: () {},
                            color: Colors.transparent,
                            child: Text(
                              'Top  Products',
                              style: TextStyle(height: 5, fontSize: 10),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: companies.map((company) {
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              company.name,
                              style: TextStyle(height: 2, fontSize: 10),
                            ),
                            Container(
                                child: Image.network(company.logo),
                                height: 80.0,
                                width: 80.0),
                            Container(
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/f/f2/Five_star_insignia.png',
                                    height: 5.0,
                                    width: 100.0)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),


            ],
          ),
        ),
      )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
