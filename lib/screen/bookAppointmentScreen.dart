import 'package:flutter/material.dart';

// ignore: camel_case_types
class bookAppointmentScreen extends StatefulWidget {
  bookAppointmentScreen({super.key});

  @override
  State<bookAppointmentScreen> createState() => _bookAppointmentScreenState();
}

class _bookAppointmentScreenState extends State<bookAppointmentScreen> {
  TextEditingController _dateTimeController = TextEditingController();
  TextEditingController _timeController = TextEditingController(); // Controller for time

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
          const SizedBox(height: 7),
          Container(
            height: 70,
            width: 500,
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
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter your full name : ",
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
              cursorHeight: 40,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              controller: _dateTimeController,
              decoration: const InputDecoration(
                labelText: "Select your appointment date : ",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.calendar_month_rounded),
              ),
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              controller: _timeController, // Add the controller for time
              decoration: const InputDecoration(
                labelText: "Select appointment time : ",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.access_time_rounded), // Time icon
              ),
              readOnly: true,
              onTap: () {
                _selectTime(context); // Call the time picker method
              },
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Mention your illness : ",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.medical_information_outlined),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Text("Your healthcare, simplified. Anytime, anywhere",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          Buttons(),
        ],
      ),

      
    );
  }

  Row Buttons() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30), // Set the desired margin here
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 50,),
              
              Container(
                margin: const EdgeInsets.only(right: 30), 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color.fromARGB(255, 54, 161, 249),
                  ),
                  onPressed: (){},
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dateTimeController.text =
            selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // Update the time controller with the selected time
      setState(() {
        _timeController.text = selectedTime.format(context);
      });
    }
  }
}
