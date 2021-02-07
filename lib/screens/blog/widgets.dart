import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
 
  //constructor
  TaskCardWidget({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      //spacing between the 2 TaskCardWidget
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        //left to right - everything starts from the left 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //if title is null, it will show "(Unnamed Task)"
            title ?? "(Unnamed Task)",
            style: TextStyle(
              color: Color(0xFF211551),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          //padding for the text body
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(
              //if description is null, it will show "No Description Added"
              description ?? "No Description Added",
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF86829D),
                //line height
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
