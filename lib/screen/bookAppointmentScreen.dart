import 'package:flutter/material.dart';

// ignore: camel_case_types
class bookAppointmentScreen extends StatefulWidget {


  bookAppointmentScreen({super.key});

  @override
  State<bookAppointmentScreen> createState() => _bookAppointmentScreenState();
}

class _bookAppointmentScreenState extends State<bookAppointmentScreen> {
  TextEditingController _dateTimeController = TextEditingController();

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
    
      body: Column(
        children: [
          const SizedBox(height: 7,),
          Container(
            height: 70,
            width: 500,
           // color: Color.fromARGB(255, 72, 162, 236),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: const Text(  
              "Good Health Care Centre",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter your full name : ",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter your address : ",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Select your appointment date : ",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.calendar_month_rounded),
                //filled: true,
              ),
              readOnly: true,
              onTap: () {
                _selectDate();
              },
            ),
          ),
        ],
      )
      
    );
  }
}

Future<void> _selectDate() async {
  var context;
  await showDatePicker(
    context: context, 
    initialDate:DateTime.now() ,
    firstDate: DateTime(2000), 
    lastDate: DateTime(2100),
    );
}

