// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screen/connectionScreens/services/auth.dart';
import 'package:healthcare_app/screen/profileScreens/aboutUs.dart';
import 'package:healthcare_app/screen/profileScreens/genaral.dart';
import 'package:healthcare_app/screen/profileScreens/notification.dart';
import 'package:healthcare_app/screen/profileScreens/profile.dart';

// ignore: camel_case_types
class settingScreen extends StatefulWidget {

  String email;

  settingScreen({required this.email});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {



  final Authentication _auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("images/doctor1.jpg"),
              ),
              title: Text(
                ' ${widget.email}', 
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text("Profile"),
            ),
            const Divider(height: 50),
            ListTile(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => profile(),
                          ));
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.person,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              title: const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const notification(),
                          ));
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const genaral(),
                          ));
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.settings_suggest_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              title: const Text(
                "Gernal",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const aboutUs(),
                          ));
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              title: const Text(
                "About Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            const SizedBox(height: 20),
            const Divider(height: 30),
            ListTile(
              onTap: () async {
                await _auth.signOut();
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
