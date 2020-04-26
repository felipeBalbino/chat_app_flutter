import 'package:chatappflutter/Chat_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Color(0xFFEA4C89)
        ),
        primaryColor: Colors.white
      ),
      home: ChatScreen(),
    );
  }
}

