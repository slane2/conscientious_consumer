import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'screens/form_hub.dart';
// import 'screens/bills.dart';
// import 'screens/user_form.dart';
// import 'firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:the_conscientious_consumer/services/auth.dart';
import 'screens/wrapper.dart';
import 'models/client.dart';

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
    return StreamProvider<Client>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
