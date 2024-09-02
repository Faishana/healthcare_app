import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class genaral extends StatelessWidget {
  const genaral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GENARAL ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 4, 60, 106),
        ),),
        backgroundColor: const Color.fromARGB(255, 148, 187, 207),
      ),
    );
  }
}