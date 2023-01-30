import 'package:flutter1102/total_page.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(
            name: '/total',
            page: () => TotalPage(),
            transition: Transition.circularReveal,
            transitionDuration: Duration(milliseconds: 400)),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text("State Management GetX"),
        ),
        body: Home(),
      ),
    );
  }
}
