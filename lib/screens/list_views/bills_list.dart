import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillList extends StatefulWidget {
  @override
  _BillListState createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    final bills = Provider.of<QuerySnapshot>(context);
    return Container();

  }
}
