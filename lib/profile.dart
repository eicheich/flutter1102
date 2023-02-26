import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter1102/chatpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter1102/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// profilepage yang membutuhkan paarameter userObj
class ProfilePage extends StatelessWidget {
  final GoogleSignInAccount userObj;
  List<String> _listProfile = [
    'Account',
    'Privacy',
    'Accessibility',
    'Logout',
  ];
  // create list profile icon
  List<IconData> _listProfileIcon = [
    Icons.account_circle_outlined,
    Icons.privacy_tip_outlined,
    Icons.accessibility_new_outlined,
    Icons.logout,
  ];
  ProfilePage({Key? key, required this.userObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        // add background color 8338EC
        backgroundColor: Color(0xFF6c5ce7),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF6c5ce7),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                // add color EFEBFD
                // color: Color(0xFFEFEBFD),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(userObj.photoUrl!),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () async {
                  //     final FirebaseMessaging _firebaseMessaging =
                  //         FirebaseMessaging.instance;
                  //     String? token = await _firebaseMessaging.getToken();
                  //     print(token);
                  //   },
                  //   child: const Text("Get FCM Token"),
                  // ),
                  // Text(userObj.displayName!),
                  // create text for userObj.displayName! with style font-size: 24px; font-weight: 700;
                  Text(
                    userObj.displayName!,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(userObj.email),
                  // create text for userObj.email with style font-size: 14px; font-weight: 500;
                  Text(
                    userObj.email!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: (() {
                  //     Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) =>
                  //                 chatpage(email: userObj.email)));
                  //   }),
                  //   child: Text("Chat"),
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     // signout
                  //     final GoogleSignIn _googleSignIn = GoogleSignIn();
                  //     _googleSignIn.signOut().then((value) {
                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const LoginPage()));
                  //     }).catchError((e) {});
                  //   },
                  //   child: const Text("Logout"),
                  // )
                  // create list view builder from _listProfile
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _listProfile.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                          height: 80,
                          decoration: BoxDecoration(
                            // add color 000 with opacity 0.05
                            color: Color(0xFF000000).withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _listProfileIcon[index],
                                size: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  if (index == 3) {
                                    //  show alert and signout
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Logout"),
                                            content: Text("Apa Kamu yakin?"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel")),
                                              TextButton(
                                                  onPressed: () {
                                                    final GoogleSignIn
                                                        _googleSignIn =
                                                        GoogleSignIn();
                                                    _googleSignIn
                                                        .signOut()
                                                        .then((value) {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const LoginPage()));
                                                    }).catchError((e) {});
                                                  },
                                                  child: Text("Logout")),
                                            ],
                                          );
                                        });
                                  }
                                },
                                child: Text(
                                  _listProfile[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
