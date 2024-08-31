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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  dateTime(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget message(int index){
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: const TextSpan(
          text: "Message ",
          style: TextStyle(
            color: Colors.black,
            
            fontWeight: FontWeight.bold,
          ),
          children: 
          [
            TextSpan(
              text: 'Notification Discription',
              style: TextStyle(
                fontWeight: FontWeight.bold,
          ),
            ),
          ],
        ),
      ), 
    );
  }

  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,

      ),
      child: const Icon(Icons.notifications,
      size: 30,
      color: Colors.grey,),
    );
  }

  Widget dateTime(int index){
    return Container(
      margin: const EdgeInsets.only(top: 7),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '24/08/2024',
            style: TextStyle(
              color:  Colors.black,
              fontSize: 10,
            ),
          ),
          Text(
            '06.24PM',
            style: TextStyle(
              color:  Colors.black,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
