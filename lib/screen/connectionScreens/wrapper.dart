import 'package:flutter/material.dart';
import 'package:healthcare_app/SplashScreen.dart';
import 'package:healthcare_app/screen/connectionScreens/models/userModel.dart';
import 'package:healthcare_app/screen/signup_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    if(user == null){
      return SignupScreen();
    }
    else{
      return SplashScreen();
    }
  }
}