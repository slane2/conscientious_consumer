import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  File image;
  Future getImage() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ethical Manufacturing Bills')),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('bills').snapshots(),
          builder: (content, snapshot) {
            if (snapshot.hasData) {
              return Material(
                child: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  var bill = snapshot.data.documents[index];
                  return ListTile(
                    leading: Image.asset('./assets/animal.png'), title: Text(bill['name'])
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
    return "${dateTime.month.toString()}-${dateTime.day.toString().padLeft(2,'0')}-${dateTime.year.toString().padLeft(2,'0')}";
}
