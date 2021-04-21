import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../models/company.dart';
import '../../shared/constants.dart';
import '../list_views/companies.dart';

// ignore: non_constant_identifier_names
var all_certs = [
  CheckBoxModal(title: 'Leaping Bunny'),
  CheckBoxModal(title: 'Cruelty Free PETA'),
  CheckBoxModal(title: 'Cradle to Cradle'),
  CheckBoxModal(title: 'Made in a country where animal testing is illegal.'),
  CheckBoxModal(title: 'Equal Salary Certified')
];

final allChecked = CheckBoxModal(title: 'All Checked');

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
                        ListView(
                          children: [
                            ...all_certs.map((item) => ListTile(
                                  onTap: () => onAllClicked(item),
                                  leading: Checkbox(
                                    value: item.value,
                                    onChanged: (value) => onAllClicked(item),
                                  ),
                                  title: Text(item.title),
                                ))
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              company.rating = 0;
                              if (company.certs.length < 5)
                                company.rating = company.certs.length;
                              else
                                company.rating = 5;
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

  onAllClicked(CheckBoxModal ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value;
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({@required this.title, this.value = false});
}
