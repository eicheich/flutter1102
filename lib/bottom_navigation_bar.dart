import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter1102/chatpage.dart';
import 'package:flutter1102/home.dart';
import 'package:flutter1102/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:super_bottom_navigation_bar/super_bottom_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  final GoogleSignInAccount userObj;

  const MyHomePage({Key? key, required this.userObj}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      chatpage(email: widget.userObj.email),
      ProfilePage(userObj: widget.userObj),
    ];

    return Scaffold(
      bottomNavigationBar: SuperBottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          SuperBottomNavigationBarItem(
            unSelectedIcon: Icons.home_outlined,
            selectedIcon: Icons.home,
          ),
          SuperBottomNavigationBarItem(
            unSelectedIcon: Icons.chat_outlined,
            selectedIcon: Icons.chat,
          ),
          SuperBottomNavigationBarItem(
            unSelectedIcon: Icons.person_outline,
            selectedIcon: Icons.person,
          ),
        ],
        onSelected: (index) {
          print('tab $index');

          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
