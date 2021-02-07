import 'package:flutter/material.dart';
import 'package:mealapp/screens/authenticate/authenticate.dart';
import 'package:mealapp/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:mealapp/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either Home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}