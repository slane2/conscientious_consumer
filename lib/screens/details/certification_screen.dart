import 'package:flutter/material.dart';
import 'package:the_conscientious_consumer/models/company.dart';
import 'package:the_conscientious_consumer/screens/home/home.dart';
import 'package:the_conscientious_consumer/screens/list_views/bills.dart';
import '../list_views/Certifications.dart';
import '../form_hub.dart';
import '../user_form.dart';
import '../../services/auth.dart';
import '../../widgets/star_rating.dart';

class CertificationScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  final certification;

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

  CertificationScreen({Key key, @required this.certification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Certifications"), actions: <Widget>[
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
                title: Text('Home'),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()));
                }),
            new ListTile(
                title: Text('Submit Data'),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new FormHub()));
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
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                certification['name'],
                style: TextStyle(height: 5, fontSize: 20),
              ),
              Container(
                child: StarRating(value: 5),
              ),
            ],
          ),
          Text(
            certification['description'],
          ),
          Image.asset('./assets/leapingbunny.png'),
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
                      'Certified Companies',
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
    );
  }
}
