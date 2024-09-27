import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/screen/settingScreen.dart';
import 'package:image_picker/image_picker.dart';


class profile extends StatefulWidget {

  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Uint8List? _image; 

  void _selectImage() async {
  Uint8List img = await pickImage(ImageSource.gallery);
  setState(() {
    _image = img;
  });
}

final _nameController = TextEditingController();
final _addressController = TextEditingController();
final _emailController = TextEditingController();

@override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
}


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
        padding: const EdgeInsets.only(top: 20),
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
                    _image != null?
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    ) :
                    Container(
                    width: 150,
                    height: 150,
                  
                  child: const Icon(Icons.person, size: 100, color: Color.fromARGB(255, 4, 60, 106),),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                    height: 35,
                    width: 35,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      onPressed: () {
                        _selectImage();
                      }, icon: const Icon(Icons.edit),
                    ),
                  ),
                ),
              ] ,
              ),
              ),
              const SizedBox(height: 10,),

              UserDetails("Full Name : ", "Faizana rafees", _nameController),
            UserDetails("Address : ", "Negama", _addressController),
            UserDetails("Email : ", "faishu@gmail.com", _emailController),
            
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30), 
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      _nameController.clear();
                      _addressController.clear();
                      _emailController.clear();
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
                    onPressed: () async {
                      CollectionReference colRef = FirebaseFirestore.instance.collection("My profile");

                      try {
                        await colRef.add({
                          'FullName': _nameController.text,
                          'Address': _addressController.text,
                          'Email': _emailController.text
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile Updated successfully!'))
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => settingScreen(
                                name: _nameController.text, 
                                email: _emailController.text,
                              ),
                            ),
                          );
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to add the Updates: $error'))
                        );
                      }
                    },

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

  Padding UserDetails(String inputText, String placeHolder ,TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: TextField(
      controller: controller, // bind the controller here
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 3, left: 10),
        labelText: inputText,
        labelStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 4, 60, 106),
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeHolder,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
}

pickImage(ImageSource source) async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if(_file != null){
    return await _file.readAsBytes();
  }
  print("No images selected!");
}
