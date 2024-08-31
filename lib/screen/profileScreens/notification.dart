import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOTIFICATIONS",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 4, 60, 106),
        ),),
        backgroundColor: const Color.fromARGB(255, 148, 187, 207),
      ),

      body: ListVeiw(),
    );
  }
}

class ListVeiw extends StatelessWidget {
  const ListVeiw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index){
      return ListVeiwItem(index);
    }, 
    separatorBuilder:  (context, index){
      return Divider(height: 0,);
    }, itemCount: 15,
    );
  }

  Widget ListVeiwItem(int index){
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message(index)
        ],
      ),
    );
  }

  Widget message(int index){
    return Container();
  }
}
