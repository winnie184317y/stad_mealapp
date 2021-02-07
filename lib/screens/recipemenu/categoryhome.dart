import 'package:flutter/material.dart';
import 'package:mealapp/screens/home/home.dart';
import 'package:mealapp/screens/recipemenu/burgerrecipe.dart';
import 'package:mealapp/screens/recipemenu/friedricerecipe.dart';
import 'package:mealapp/screens/recipemenu/japchaerecipe.dart';
import 'package:mealapp/screens/recipemenu/ramenrecipe.dart';

void main() => runApp(CatHome());

class CatHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Home()));
          },
        ),
        title: Text('Meal Category'),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => BurgerRecipe()));
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/western_cuisine.jpg'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FriedRiceRecipe()));
              },
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/chinese_cuisine.jpg'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RamenRecipe()));
              },
              child: Center(
                child: Container(
                  width: 140,
                  height: 140,
                  child: Image.asset('assets/images/japanese_cuisine.png'),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JapchaeRecipe()));
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/korean_cuisine.jpg'),
                ),
              )),
        ),
      ],
    );
  }
}
