import 'package:flutter/material.dart';

class BillForm extends StatefulWidget {
  @override
  _BillFormState createState() => _BillFormState();
}

class _BillFormState extends State<BillForm> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bill Form'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              }, 
            )
          ]
        ),
      ),
    );
  }
}
