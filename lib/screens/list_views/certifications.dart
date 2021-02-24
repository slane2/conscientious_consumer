import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../bill_screen.dart';
import '../../widgets/star_rating.dart';

class Certifications extends StatefulWidget {
  @override
  _CertificationsState createState() => _CertificationsState();
}

class _CertificationsState extends State<Certifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ethical Certifications')),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('certifications').snapshots(),
          builder: (content, snapshot) {
            if (snapshot.hasData) {
              return Material(
                child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    var certification = snapshot.data.documents[index];
                    return ListTile(
                      title: Text(certification['name']),
                      trailing: StarRating(value: certification['rating']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BillScreen(),
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
