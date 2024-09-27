import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/screen/connectionScreens/models/userModel_signUp.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UsermodelSignup user) async {
    await _db.collection("users").add(user.toJson()).whenComplete(() {
      Get.snackbar(
        "Success",
        "Your account has been created!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.withOpacity(0.2),
      );
    }).catchError((error) {
      Get.snackbar(
        "Error",
        "Failed to create an account: $error",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.2),
      );
    });
  }
}
