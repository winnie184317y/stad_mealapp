import 'package:flutter/material.dart';
import 'package:mealapp/screens/blog/widgets.dart';
import 'package:mealapp/screens/home/home.dart';

class BlogHomePage extends StatefulWidget {
  @override
  _BlogHomePage createState() => _BlogHomePage();
}

class _BlogHomePage extends State<BlogHomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 1,
          title: Text('Blog'),
          //back-arrow
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
            //settings button
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        //SafeArea is to allow overflow of contents within the screen
        body: SafeArea(
          child: Container(
            //expand the width of the screen to the whole page
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            //background color
            color: Color(0xFFF6F6F6),
            child: Column(
              //left to right - everything starts from the left
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //margin below the logo
                  margin: EdgeInsets.only(
                    bottom: 32.0,
                  ),
                  child: Image(
                    image: AssetImage(
                      'assets/images/logo.png'
                    ),
                  ),
                ),
                TaskCardWidget(
                  title: "Understanding Calories",
                  description: "When counting calories, it is important to consider looking beyond the numbers to consider the nutrients that make up those calories.",
                ),
                TaskCardWidget(
                  title: "How much Calories we need?",
                  description: "The average adult body requires roughly 2,000 calories intake a day. Your body weight is a direct reflection of your energy balance.",
                ),
              ],
            ),
          ),
        ),
      );   
  }
}