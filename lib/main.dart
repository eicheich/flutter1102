import 'package:flutter/material.dart';
import 'package:flutter1102/Helper/Wrapper.dart';
import 'package:flutter1102/login.dart';
import 'package:flutter1102/signin.dart';
import 'package:provider/provider.dart';

import 'change-color-provider.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
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
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}
