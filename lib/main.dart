import 'package:flutter/material.dart';
import 'package:healthcare_app/screen/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: welcomeScreen(),
    );
  }
}
