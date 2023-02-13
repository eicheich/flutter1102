import 'package:flutter/material.dart';
import 'package:flutter1102/home.dart';
import 'package:flutter1102/login.dart';
import 'package:flutter1102/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoggedIn
            // ? Column(
            //     children: [
            //       // Image.network(_userObj.photoUrl),
            //       // Text(_userObj.displayName),
            //       Text(_userObj.email),
            //       TextButton(
            //           onPressed: () {
            //             _googleSignIn.signOut().then((value) {
            //               setState(() {
            //                 _isLoggedIn = false;
            //               });
            //             }).catchError((e) {});
            //           },
            //           child: Text("Logout"))
            //     ],
            //   )
            ?  HomePage()
            // : Center(
            //     child: ElevatedButton(
            //       child: Text("Login with Google"),
            //       onPressed: () {
            //         // signin with google
            //         _googleSignIn.signIn().then((userData) {
            //           setState(() {
            //             _isLoggedIn = true;
            //             _userObj = userData!;
            //           });
            //         }).catchError((e) {});
            //       },
            //     ),
            //   ),
        : LoginPage(),
      ),
    );
  }
}
