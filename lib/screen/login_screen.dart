import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screen/connectionScreens/services/auth.dart';
import 'package:healthcare_app/screen/homeScreen.dart';
import 'package:healthcare_app/screen/signup_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  final Authentication _auth = Authentication();

  //final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error ="";

  bool passToggle = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Updated here
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset("images/doctors.png"),
              ),
              const SizedBox(height: 10,),
              Padding(
                //key: _formKey,
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: (value) => value?.isEmpty == true ? "Enter a valied email" : null,
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter email"),
                    prefixIcon: Icon(Icons.person),
                  ),
                  //controller: _email,
                ),
              ),
              Padding(
                //key: _formKey,
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: (value) => value!.length < 6? "Enter a valied password" : null,
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },

                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("Enter password"),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: passToggle
                          ? const Icon(CupertinoIcons.eye_slash_fill)
                          : const Icon(CupertinoIcons.eye_fill),
                    ),
                  ),
                 // controller: _password,
                ),
              ),
              Text(error,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),

              Padding(
                //key: _formKey,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: const Color.fromARGB(255, 8, 119, 211),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () async {
                        dynamic result =  await _auth.signinWithEmailPassword(email, password);

                        if(result == null){
                          setState(() {
                            error = "Couldn't signin to your account!";
                          });
                        }
                        else{
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homeScreen(), 
                          ),
                        );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                   // key: _formKey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 119, 211),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}