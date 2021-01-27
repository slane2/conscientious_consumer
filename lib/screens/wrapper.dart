import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_conscientious_consumer/screens/home/home.dart';
import 'package:the_conscientious_consumer/screens/authenticate/authenticate.dart';
import '../models/client.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Client>(context);
    print(user);

    //return either Home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
