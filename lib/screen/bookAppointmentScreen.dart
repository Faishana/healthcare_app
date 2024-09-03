import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class bookAppointmentScreen extends StatelessWidget {
  const bookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 148, 187, 207),
        title: const Text(
          "Make an Appointment Here",
          style: TextStyle(
            color: Color.fromARGB(255, 4, 60, 106),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}