import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 148, 187, 207),
        title: const Text(
          "ABOUT US",
          style: TextStyle(
            color: Color.fromARGB(255, 4, 60, 106),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
          height: 80,
          child: Center(
            child: Text(
              "Welcome to our e-channeling Application",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 60, 106),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ), 

        SizedBox(height: 20), 
        Text(
          "This application allows you to conveniently book medical appointments with your preferred doctors. You can easily browse through the list of available specialists and choose the best one that suits your needs.",
          style: TextStyle(fontSize: 16,
          fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 10), 

        Text(
          "We aim to provide a seamless experience for our users by offering a simple and efficient way to manage your health care needs. Stay tuned for more updates and features.",
          style: TextStyle(fontSize: 16,
          fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ), 

        SizedBox(height: 30),
        Text(
          "This Application was created by",
          style: TextStyle(
            color: Color.fromARGB(255, 4, 60, 106),
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 10),
        Text(
          "RAFEESH FATHIMA FAISANA",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 3),
        Text(
          "BICT(Reading)",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),

        ],  
      
        ),
      ),
    );
  }
}