import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter1102/chatpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter1102/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// profilepage yang membutuhkan paarameter userObj
class ProfilePage extends StatelessWidget {

  final GoogleSignInAccount userObj;
  const ProfilePage({Key? key, required this.userObj}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.network(userObj.photoUrl!),
            TextButton(
                onPressed: () async {
                  final FirebaseMessaging _firebaseMessaging =
                      FirebaseMessaging.instance;
                  String? token = await _firebaseMessaging.getToken();
                  print(token);
                },
                child: const Text("Get FCM Token")),

            Text(userObj.displayName!),
            Text(userObj.email),
            ElevatedButton(onPressed: (() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  chatpage(email: userObj.email)));

            }), child: Text("Chat")),
            TextButton(
                onPressed: () {
                  // signout
                  final GoogleSignIn _googleSignIn = GoogleSignIn();
                  _googleSignIn.signOut().then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }).catchError((e) {});
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
