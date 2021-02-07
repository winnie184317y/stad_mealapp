import 'package:flutter/material.dart';

void main() => runApp(JapchaeRecipe());

class JapchaeRecipe extends StatelessWidget {
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
                'https://rasamalaysia.com/wp-content/uploads/2011/06/japchae2-1.jpg',
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
        'Authentic Japchae\n\nDuration: 30mins\n\nIngredients:\n8 oz sweet potato noodles\n3 oz spinach\n2 tbsp oil\n2 cloves garlic and 1/2 small onion (sliced)\n1 small carrot, cut into thin strips\n2 tbsp light soy sauce\n1/2 tbsp sesame oil and salt\n4 tbsp soy sauce\n\nSteps: \n1) Boil the sweet potato noodles.\n2) Heat up the oil in wok and stir-fry the garlic, onion, carrot and condiments\n3) Stir to combine well\n4) Assemble the japchae and garnish wish sesame seeds. Serve at room temperature. 맛있게 드세요!',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    )
    );
  }
}
