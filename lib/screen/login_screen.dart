import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screen/homeScreen.dart';
import 'package:healthcare_app/screen/signup_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("images/doctors.png"),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Username"),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: const Text("Enter password"),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      if (passToggle == true) {
                        passToggle = false;
                      } else {
                        passToggle = true;
                      }
                      setState(() {});
                    },
                    child: passToggle
                        ? const Icon(CupertinoIcons.eye_slash_fill)
                        : const Icon(CupertinoIcons.eye_fill),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: const Color.fromARGB(255, 8, 119, 211),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homeScreen(),
                          ));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //  const SizedBox(height: ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont't have any account..?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const signupScreen(),
                        ));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 119, 211),
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
