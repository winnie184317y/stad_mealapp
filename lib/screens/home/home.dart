import 'package:flutter/material.dart';
import 'package:mealapp/screens/aboutus/aboutus.dart';
import 'package:mealapp/screens/blog/homepage.dart';
import 'package:mealapp/screens/calculator/calculator.dart';
import 'package:mealapp/screens/recipemenu/categoryhome.dart';
import 'package:mealapp/services/auth.dart';
import 'package:mealapp/screens/authenticate/sign_in.dart';
import '../profile/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Meal App - DashBoard'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              // await _auth.signOut();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new SignIn()));
            },
          )
        ],
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  Future<void> _makePhoneCall(String contact, bool direct) async {
    if (direct == true) {
      bool res = await FlutterPhoneDirectCaller.callNumber(contact);
    } else {
      String telScheme = 'tel:$contact';

      if (await canLaunch(telScheme)) {
        await launch(telScheme);
      } else {
        throw 'Could not launch $telScheme';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/editprofile.png'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CatHome()));
              },
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/recipes.png'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/aboutus.png'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlogHomePage()));
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/blog.png'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalculatorApp()));
              },
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/caloriescal.png'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () => _makePhoneCall('98411776', true),
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/contactus.png'),
                ),
              )),
        ),
      ],
    );
  }
}
