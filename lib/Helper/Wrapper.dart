import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter1102/login.dart';
import 'package:flutter1102/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _isLoggedIn = false;
  late GoogleSignInAccount userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    // return jika user sudah login maka akan ke profile jika belum maka ke login
    return StreamBuilder(
        stream: Firebase.initializeApp().asStream(),
        builder: (context, snapshot) {
          if (_isLoggedIn) {
            return ProfilePage(userObj: userObj);
          } else {
            return LoginPage();
          }
        });
  }
}

// check jika user sudah login atau belum

