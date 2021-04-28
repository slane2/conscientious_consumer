import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../details/company_screen.dart';
import '../../widgets/star_rating.dart';

class Companies extends StatefulWidget {
  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ethical Companies')),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('companies').snapshots(),
          builder: (content, snapshot) {
            if (snapshot.hasData) {
              return Material(
                child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    var company = snapshot.data.documents[index];
                    return ListTile(
                      title: Text(company['name']),
                      trailing: StarRating(value: 4),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyScreen(company: company),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

String formatDate(Timestamp date) {
  DateTime dateTime = date.toDate();
  return "${dateTime.month.toString()}-${dateTime.day.toString().padLeft(2, '0')}-${dateTime.year.toString().padLeft(2, '0')}";
}
