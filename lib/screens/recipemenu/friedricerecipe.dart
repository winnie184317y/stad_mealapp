import 'package:flutter/material.dart';

void main() => runApp(FriedRiceRecipe());

class FriedRiceRecipe extends StatelessWidget {
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
                'https://www.thespruceeats.com/thmb/HK4ileO83JK_XGiG_ZOLzGmCwDU=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/basic-recipe-for-fried-rice-695055-Hero_2-5b9fc29f46e0fb0025036538.jpg',
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
        'Basic Fried Rice\n\nDuration: 15mins\n\nIngredients:\n1 to 2 green onions (chopped)\n2 eggs\nFreshly ground pepper\n1 tsp salt\n3 tbsp oil\n2 tbsp light soy sauce\n2 cups rice (cooked and cold)\n\nSteps: \n1) Wash and slice the green onions. Lightly beat the eggs with salt and pepper,\n2) Heat wok and add oil. Add the eggs and lightly scramble\n3) Add the rice and the condiments\n4) Assemble the fried rice and garnish. Serve immediately. 开动!',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    )
    );
  }
}
