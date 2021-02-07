import 'package:flutter/material.dart';
import '../home/home.dart';
 
void main() => runApp(AboutUs());
 
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.blue[400],
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => new Home()));
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: Text(
              'Developer: \n Winnie Charis Goh \n Version 9.3.0 \n \n Recipes Made Easy for \neasy everyday home cooked dishes \n for your family, friends and fun. \n Home cooking should be fun and \n never be hard work! ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}