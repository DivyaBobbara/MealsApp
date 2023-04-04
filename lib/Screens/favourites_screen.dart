import 'package:flutter/material.dart';
import '../Model/meal.dart';
import '../Widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<dynamic> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
   if(favouriteMeals.isEmpty) {
     return Center(
       child:Text("You have no favourites yet! start adding some!!"),
     );
   } else {
     return ListView.builder(
       itemBuilder: (context, index) {
         return MealItem(
           id: favouriteMeals[index].id,
           title: favouriteMeals[index].title,
           imageUrl: favouriteMeals[index].imageUrl,
           duration: favouriteMeals[index].duration,
           complexity: favouriteMeals[index].complexity,
           affordability: favouriteMeals[index].affordability,
           // removeItem: _removeMeal,
         );
       },
       itemCount: favouriteMeals.length,
     );
   }
  }
}
