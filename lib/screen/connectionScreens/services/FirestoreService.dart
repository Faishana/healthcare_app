import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Create an instance of FirebaseFirestore
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add user method to store user details in Firestore
  Future<void> addUser(String uid, String fullName, String email, String location) async {
    try {
      // Set the user document with provided details
      await _db.collection('users').doc(uid).set({
        'fullName': fullName,
        'email': email,
        'location': location,
        'createdAt': FieldValue.serverTimestamp(), // Optional: Add timestamp
      });
      print("User added successfully!");
    } catch (e) {
      print("Error adding user to Firestore: $e");
      throw e;  // Re-throw the error for further handling if needed
    }
  }
}
