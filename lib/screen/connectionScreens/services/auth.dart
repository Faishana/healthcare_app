import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare_app/screen/connectionScreens/models/userModel.dart';
import 'package:healthcare_app/screen/connectionScreens/services/FirestoreService.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  UserModel? _userWithFirebaseUid(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future registerWithEmailPassword(String fullName, String email, String password, String location) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        await _firestoreService.addUser(user.uid, fullName, email, location);
      }

      return user;
    } catch (e) {
      print("Error during registration: $e");
      return null;
    }
  }

  Future signinWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userWithFirebaseUid(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUid);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
