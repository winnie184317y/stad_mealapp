import 'package:flutter/material.dart';

void main() => runApp(RamenRecipe());

class RamenRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //Part of the scrollable area where the actual scrolling effect can be customised
        slivers: <Widget>[
          //linked to CustomScrollView Widget
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.blue[400],
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Recipes',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              background: Image.network(
                'https://www.forkknifeswoon.com/wp-content/uploads/2014/10/simple-homemade-chicken-ramen-fork-knife-swoon-01.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Center _buildContent() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(20,20,20,20),
      child: Text(
        'Simple Homemade Chicken Ramen\n\nDuration: 45mins\n\nIngredients:\n2 chicken breasts(boneless, skin-on),\n2 tbsp sesame oil\n2 tbsp fresh ginger\n3 tsp fresh garlic, minced\n3 tbsp soy sauce\n2 tbsp mirin\n4 cups chicken stock\n1 egg\n1 pack ramen noodles\n\nSteps: \n1) Oven bake the chicken until skin is golden brown,\n2) Combine all sauces and chicken stock and simmer for 15 mins\n3) Boil the egg for 7 mins\n4) Assemble the ramen bowls and garnish. Serve immediately. Meshiagare!',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    )
    );
  }
}
