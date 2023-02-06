import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column (
          children: [
            const Text("Profile Page"),
            Column(
              children: [
                // Text("Hi, ${GoogleSignIn().currentUser!.displayName!}"),
                // Text("Email: ${GoogleSignIn().currentUser!.email}"),
                Text("Hi, ${_userObj.displayName}"),
                Text(_userObj.email),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white10),
              ),
              child: const Text("Logout",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                _googleSignIn.signOut().then((value) {
                  setState(() {
                    _isLoggedIn = false;
                  });
                }).catchError((e) {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
