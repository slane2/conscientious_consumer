import 'package:firebase_auth/firebase_auth.dart';
import '../models/client.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create User object based on Firebase user
  Client _userFromFirebaseUser(User user) {
    return user != null ? Client(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Client> get user {
    return _auth.authStateChanges()
      .map((User user) => _userFromFirebaseUser(user));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //sign out
}
