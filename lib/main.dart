import 'package:flutter/material.dart';
import 'package:mealapp/models/user.dart';
import 'package:mealapp/screens/wrapper.dart';
import 'package:mealapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
           debugShowCheckedModeBanner: false,
           //change the fonts
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
        home: Wrapper(),
      ),
    );
  }
}

