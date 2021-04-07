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
                        CheckboxListTile(
                          title: Text('100% Post Consumer Recycled Products'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('100% Post Consumer Recycled Products');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('B Corp'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('B Corp');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('CDP Climate Change A List'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('CDP Climate Change A List');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Certified Vegan'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Certified Vegan');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('COSMOS organic/natural'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('COSMOS organic/natural');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('B Corp'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('B Corp');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Covalence ESG High Score'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Covalence ESG High Score');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Cradle to Cradle'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Cradle to Cradle');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Cruelty Free (PETA)'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Cruelty Free (PETA)');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Cruelty Free Kitty'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Cruelty Free Kitty');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Equal Salary Certified'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Equal Salary Certified');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Ethisphere World’s Most Ethical Companies'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Ethisphere World’s Most Ethical Companies');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Fair For Life'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Fair For Life');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Fair Trade Federation'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Fair Trade Federation');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Fair wage Network'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Fair wage Network');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Human Rights Campaign CEI Perfect Score'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Human Rights Campaign CEI Perfect Score');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Leaping Bunny'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Leaping Bunny');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Made in a country where animal testing is illegal'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Made in a country where animal testing is illegal');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Made in America'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Made in America');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('One to One'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('One to One');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Plastic Free Packaging'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Plastic Free Packaging');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('Rainforest Alliance'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('Rainforest Alliance');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('RSPO'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('RSPO');
                            });
                          }
                        ),
                        CheckboxListTile(
                          title: Text('The Vegan Society'),
                          secondary: Image.asset('./assets/planet.png'),
                          value: company.checked,
                          onChanged: (bool value) {
                            setState(() {
                              company.checked = value;
                              company.certs.add('The Vegan Society');
                            });
                          }
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              company.rating = 0;
                              if (company.certs.length > 0 and company.certs.length < 2)
                                certification.rating = 1;
                              if (company.certs.length > 1 and company.certs.length < 3)
                                certification.rating = 2;
                              if (company.certs.length > 2 and company.certs.length < 4)
                                certification.rating = 3;
                              if (company.certs.length > 3 and company.certs.length < 5)
                                certification.rating = 4;
                              if (company.certs.length >= 5)
                                certification.rating = 5;
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
