import 'package:healthcare_app/screen/homeScreen.dart';
import 'package:healthcare_app/screen/messageScreen.dart';
import 'package:healthcare_app/screen/scheduleScreen.dart';
import 'package:healthcare_app/screen/settingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class navbarRootScreen extends StatefulWidget {
  const navbarRootScreen({super.key});

  @override
  State<navbarRootScreen> createState() => _navbarRootScreenState();
}

// ignore: camel_case_types
class _navbarRootScreenState extends State<navbarRootScreen> {
  int selectIndex = 0;
  final screens = [
    //Home Screen
    homeScreen(),
    //Messages Screen
    messageScreen(),
    //Schedule screen
    const scheduleScreen(),
    //Sttengs Screen
    settingScreen(email: '',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 8, 119, 211),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Schedule"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}