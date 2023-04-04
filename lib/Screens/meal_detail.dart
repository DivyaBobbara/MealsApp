import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'MealDetailScreen';
  final Function toggleFavourites;
  final Function isFav;

  MealDetailScreen(this.toggleFavourites,this.isFav);

  Widget buildSectionTitle(BuildContext context,String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: Theme.of(context).textTheme.titleSmall),

    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    child:child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
              ),
              buildSectionTitle(context, 'Ingredients'),
             buildContainer(ListView.builder(itemBuilder: (ctx,index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(selectedMeal.ingredients[index])),
                  );

                },itemCount: selectedMeal.ingredients.length,) ,
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(itemBuilder: (ctx,ind) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(ind+1)}'),
                          ),
                          title: Text(selectedMeal.steps[ind]),

                        ),
                        Divider(),
                      ],
                    );
                },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      floatingActionButton:FloatingActionButton(
        child: Icon(isFav(mealId) ? Icons.star : Icons.star_border),
        // onPressed: () => Navigator.of(context).pop(mealId),
        onPressed: () => toggleFavourites(mealId),
      ),

    );
  }
}
