import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:  const Icon(Icons.arrow_back_ios,
              color: Colors.blue,),
              onPressed:  (){
                
              }),
        elevation: 1,
        backgroundColor: Colors.transparent,

      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const Center(
              child: Text("Edit Your Profile",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 60, 106),
                fontStyle: FontStyle.italic,
              ),),
            ),
            SizedBox(height: 15,),
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
          ],
        ),
      ),

    );
  }
}
