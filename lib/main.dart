import 'package:flutter/material.dart';
import 'package:flutter1102/Helper/Wrapper.dart';
import 'package:flutter1102/login.dart';
import 'package:flutter1102/signin.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'form.dart';

import 'change-color-provider.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeColorModel()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff63A5F1),
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
        home: const Wrapper(),
      ),
    );
  }
}
