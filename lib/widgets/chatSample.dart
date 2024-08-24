// ignore: file_names, depend_on_referenced_packages
// ignore_for_file: camel_case_types

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class chatSample extends StatelessWidget {
  const chatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text(
                "Hello, what i can do for you, you can book an appointment",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 25, right: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 111, 149, 214),
                ),
                child: const Text(
                  "Hello doctor are you there?",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
