import 'package:flutter/material.dart';
import 'package:healthcare_app/screen/appointmentScreen.dart';
import 'package:healthcare_app/screen/bookAppointmentScreen.dart';
import 'package:healthcare_app/screen/chatScreen.dart';
import 'package:healthcare_app/screen/doctor.dart';
import 'package:healthcare_app/screen/messageScreen.dart';
import 'package:healthcare_app/widgets/chatSample.dart';
import 'package:healthcare_app/widgets/navbarRootScreen.dart';

void main() {
  runApp(const MaterialApp(
    home: navbarRootScreen(),
  ));
}

class homeScreen extends StatelessWidget {
  final List<String> images = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.png",
    "doctor6.jpg",
    "doctor7.jpg",
  ];

  final List<String> doctorNames = [
    "Dr. Akshana",
    "Dr. Jane Smith",
    "Dr. Emily Davis",
    "Dr. Ravichandran",
    "Dr. Naleef",
    "Dr. Samras",
    "Dr. Chamara",
  ];

  final List<String> specialties = [
    "Cardiologist",
    "Therapist",
    "Nuro surgon",
    "VOG",
    "Dentist",
    "VP",
    "Surgon",
  ];

  final List<double> ratings = [
    4.9,
    4.8,
    4.7,
    4.6,
    4.3,
    4.8,
    4.5,
  ];

  homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Alex",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/heart.png"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bookAppointmentScreen(),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 8, 119, 211),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 6,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 8, 119, 211),
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Clinic visit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Make an appointment",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => chatScreen(),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 6,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 223, 229, 235),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.home_filled,
                              color: Color.fromARGB(255, 8, 119, 211),
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Home visit",
                            style: TextStyle(
                              color: Color.fromARGB(255, 12, 12, 12),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Call the doctor home",
                            style: TextStyle(
                              color: Color.fromARGB(255, 12, 12, 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Popular doctors",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: images.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => appointmentScreen(),
                        settings: RouteSettings(
                          arguments: Doctor(
                            name: doctorNames[index],
                            specialty: specialties[index],
                            image: images[index],
                            rating: ratings[index],
                          ), // Pass the doctor object
                        ),
                      ),
                    );

                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/${images[index]}"),
                          ),
                          Text(
                            doctorNames[index], 
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                           Text(
                            specialties[index], 
                            style:const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                           Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 4, 172, 10),
                              ),
                              Text(
                                ratings[index].toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
