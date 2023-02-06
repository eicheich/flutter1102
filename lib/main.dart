// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_cast, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter1102/home.dart';
import 'package:get/get.dart';

import 'form.dart';

void main() async {
  //do initialization to use firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: '/home',
            page: () => HomePage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/form',
            page: () => FormPage(),
            transition: Transition.circularReveal)
      ],
      home: const HomePage(),
    );
  }
}
