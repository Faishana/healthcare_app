import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/screen/appointmentScreen.dart';

// ignore: camel_case_types
class bookAppointmentScreen extends StatefulWidget {
  bookAppointmentScreen({super.key});

  final fNameController = TextEditingController();
  final addressController = TextEditingController();
  final illenessController = TextEditingController();

  @override
  State<bookAppointmentScreen> createState() => _bookAppointmentScreenState();
}

class _bookAppointmentScreenState extends State<bookAppointmentScreen> {

  TextEditingController _dateTimeController = TextEditingController();
  TextEditingController _timeController = TextEditingController(); 

  @override
  void dispose() {
    widget.fNameController.dispose();
    widget.addressController.dispose();
    _dateTimeController.dispose();
    _timeController.dispose();
    widget.illenessController.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                controller: widget.fNameController,
                decoration: const InputDecoration(
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
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                controller: widget.addressController,
                decoration: const InputDecoration(
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
                controller: _timeController, 
                decoration: const InputDecoration(
                  labelText: "Select appointment time : ",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(Icons.access_time_rounded), 
                ),
                readOnly: true,
                onTap: () {
                  _selectTime(context); 
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                controller: widget.illenessController,
                decoration: const InputDecoration(
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
            const SizedBox(height: 18,),
            const Text("Your healthcare, simplified. Anytime, anywhere",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            Buttons(),
          ],
        ),
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
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => appointmentScreen(),
                            ));
                  },
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
                  onPressed: () {
                    CollectionReference colRef = FirebaseFirestore.instance.collection('Appointment_details');
                    colRef.add({
                      'FullName': widget.fNameController.text,
                      'Address': widget.addressController.text,
                      'Date': _dateTimeController.text,
                      'Time': _timeController.text,
                      'Illness': widget.illenessController.text, 
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Appointment added successfully!')));
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add appointment: $error')));
                    });
                  },

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
