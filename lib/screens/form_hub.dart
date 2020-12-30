import 'package:flutter/material.dart';
import 'bill_form.dart';

class FormHub extends StatefulWidget {
  @override
  _FormHubState createState() => _FormHubState();
}

class _FormHubState extends State<FormHub> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Entry Forms'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => BillForm()),
              );
            }, child: Text('Bill Form'),),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
