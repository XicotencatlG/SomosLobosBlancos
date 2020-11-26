import 'package:flutter/material.dart';
import 'package:lobosblancos/ui/Login/Login_Pagues.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Somos Lobos Blancos',
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}

