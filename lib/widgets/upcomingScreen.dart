// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class upcomingScreen extends StatefulWidget {


  const upcomingScreen({super.key});

  @override
  State<upcomingScreen> createState() => _upcomingScreenState();
}

class _upcomingScreenState extends State<upcomingScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String _uid;
  late String _doctorName;
  late String _date;
  late Timestamp _time;
  late String _doctorImageUrl; 

    void getData() async{
      User? user = _auth.currentUser;
      _uid = user!.uid;
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("Appointment_Details").doc(_uid).get();
      _date = userDoc.get("Date");
      _time = userDoc.get("Time");
    }

  @override
  Widget build(BuildContext context) {      
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text(
                            "Dr. Doctor name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Therapist",
                          ),
                          trailing: CircleAvatar(
                            backgroundImage: AssetImage("images/doctor1.jpg"),
                            radius: 25,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            thickness: 1,
                            height: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  _date ,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  color: Colors.black54,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "10.30.00",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Confirmed",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 150,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(31, 201, 190, 190),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 150,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(31, 226, 160, 160),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Reschedule",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
          
              ],
            ),
          );    
  }
}
