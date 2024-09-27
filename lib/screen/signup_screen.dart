import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/screen/connectionScreens/models/userModel_signUp.dart';
import 'package:healthcare_app/screen/connectionScreens/services/auth.dart';
import 'package:healthcare_app/screen/connectionScreens/services/userReposatory.dart';
import 'package:healthcare_app/screen/homeScreen.dart';
import 'package:healthcare_app/screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController(); 

  final Authentication _auth = Authentication();
  final UserRepository _userRepo = Get.put(UserRepository()); 

  String email = "";
  String password = "";
  String error = "";

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
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "images/doctors.png",
                  height: 200,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: _email, // Use the email controller
                  validator: (value) =>
                      value?.isEmpty == true ? "Enter a valid email" : null,
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextFormField(
                  controller: _password, // Use the password controller
                  validator: (value) =>
                      value!.length < 6 ? "Enter a valid password" : null,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                error,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(),
                child: Text(
                  "Login with your social account!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 4, 60, 106),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle Google Sign-in here
                },
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(
                    "images/google.jpg",
                    height: 60,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const loginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 119, 211),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: const Color.fromARGB(255, 8, 119, 211),
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () async {
                        dynamic result = await _auth.registerWithEmailPassword(
                          _email.text.trim(), 
                          _password.text.trim(),
                        );

                        if (result == null) {
                          setState(() {
                            error = "Could not register with those credentials.";
                          });
                        } else {
                          final user = UsermodelSignup(
                            uid: result.uid,
                            email: _email.text.trim(),
                            password: _password.text.trim(),
                          );
                          
                          await _userRepo.createUser(user);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homeScreen(
                                name: _email.text.trim(),  // Passing email to homeScreen
                              ),
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Center(
                          child: Text(
                            "Create an Account",
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
            ],
          ),
        ),
      ),
    );
  }
}
