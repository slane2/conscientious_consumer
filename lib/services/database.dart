import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference billCollection =
      FirebaseFirestore.instance.collection('bills');

  final CollectionReference certificationCollection =
      FirebaseFirestore.instance.collection('certifications');

  final CollectionReference companyCollection =
      FirebaseFirestore.instance.collection('companies');

  Future updateBillData(String name, String description, String source_name,
      String source_url, String year, String passed) async {
    return await billCollection.doc().set({
      'name': name,
      'description': description,
      'source_name': source_name,
      'source_url': source_url,
      'year': year,
      'passed': passed
    });
  }
}
