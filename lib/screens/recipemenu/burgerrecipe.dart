import 'package:flutter/material.dart';

void main() => runApp(BurgerRecipe());

class BurgerRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //silvers - Part of the scrollable area where the actual scrolling effect can be customised
        slivers: <Widget>[
          //SilverAppBar is a Collapsing ToolBar
          SliverAppBar(
            //linked to CustomScrollView Widget
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.blue[400],
            expandedHeight: 200,
            //to ensure the app bar remains visible during scrolling
            pinned: true,
            //will be in the background of the entire app bar
            //it will have the same height as the height of the whole app bar
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Recipes',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              background: Image.network(
                'https://hips.hearstapps.com/hmg-prod/images/190416-chicken-burger-082-1556204252.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            //is a silver that contains only 1 single box child to fill the remaining space in the viewport
            //it will size its child to fill the viewport in the cross axis
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Center _buildContent() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Text(
            'Classic Hamburger\n\nDuration: 45mins\n\nIngredients:\n300g Cattle Hack,\n1 Tomato\n1 Cucumber\n1 Onion\nKetchup\n2 Burger Buns \n\n Steps: \n 1) Form 2 patties, \n 2) Fry the patties for 4 minutes on \n each side. \n 3) Quickly fry the buns for 1 minute \n on each side \n 4) Apply buns with ketchup and \n serve burger with tomato, \n cucumber and onion.\n\n Bon Appetit!',
            style: TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}
