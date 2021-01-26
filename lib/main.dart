import 'package:flutter/material.dart';
import 'screens/form_hub.dart';
import 'screens/bills.dart';
import 'screens/user_form.dart';
import 'firebase.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

const mainColor = Color(0XFF2979FF);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
