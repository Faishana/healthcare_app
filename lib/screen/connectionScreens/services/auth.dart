import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare_app/screen/connectionScreens/models/userModel.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userWithFirebaseUid(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future registerWithEmailPassword(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email, 
      password: password
    );
    User? user = result.user;
    return _userWithFirebaseUid(user);
  } catch (error) {
    print("Error during registration: ${error.toString()}");
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

  Stream<UserModel?> get user{
    return _auth.authStateChanges().map(_userWithFirebaseUid);
  }

  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  } 
}