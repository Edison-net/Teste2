import 'package:flutter/material.dart';
import 'package:teste2/android/pages/jogar.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Jogar(),
    );
  }
}
