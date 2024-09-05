// ignore: file_names
// ignore: file_names
import 'package:healthcare_app/screen/login_screen.dart';
import 'package:healthcare_app/widgets/navbarRootScreen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const navbarRootScreen()));
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 119, 211),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("images/doctors.png"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Doctors Appoinment",
              style: TextStyle(
                color: Color.fromARGB(255, 8, 119, 211),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Appoint your doctor",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: const Color.fromARGB(255, 8, 119, 211),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const loginScreen(),
                          ));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
