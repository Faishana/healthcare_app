import 'package:flutter/material.dart';


class profile extends StatefulWidget {

  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT YOUR PROFILE",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 4, 60, 106),
        ),
        ),
               
        backgroundColor: const Color.fromARGB(255, 148, 187, 207),

      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(height: 15,),
              Center(
                child: Stack(
                  children: [
                    Container(
                    
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("images/doctor1.jpg"),
                      fit: BoxFit.contain,
                      
                    ),
                  ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ] ,
              ),
              ),
              const SizedBox(height: 10,),

              UserDetails("NIC Number : ", "xxxxxxxxxxx", false),
              UserDetails("Full Name : ", "Faizana rafeesh", false),
              UserDetails("Address : ", "Kekirawa/ Galnewa", false),
              UserDetails("Password : ", "**************", true),
            
            const SizedBox(height: 20,),

            Row(
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
                      "SAVE",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ], 
          ),
        ),
      ),

    );
  }

  // ignore: non_constant_identifier_names
  Padding UserDetails(String inputText, String placeholderText, bool isPasswordFeild) {
    return Padding(
      padding: const EdgeInsets.only(bottom :20),
      child: TextField(
        obscureText: isPasswordFeild ? showPassword : false,
                decoration: InputDecoration(
                  suffixIcon:isPasswordFeild? IconButton(
                    onPressed: (){
                      setState(() {
                        showPassword = !showPassword; 
                      });
                    
                  }, 
                  icon: const Icon(Icons.remove_red_eye,
                  color: Colors.grey,),
                  ) : null,

                  contentPadding: const EdgeInsets.only(bottom: 3, left: 10),
                  labelText: inputText,
                  labelStyle: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 4, 60, 106),
                    fontWeight: FontWeight.bold,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholderText,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
              ),
    );
  }
}
