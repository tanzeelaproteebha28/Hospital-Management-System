import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MediCareApp());
}

class MediCareApp extends StatelessWidget {
  MediCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediCare Hospital',

      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: LoginPage(),
    );
  }
}