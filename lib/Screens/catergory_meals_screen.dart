import 'package:flutter/material.dart';
import 'package:meals/Widgets/meal_item.dart';
import '../dummy_data.dart';
import '../Model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "CategoryMealsScreen";

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String category_id;
  String category_name = '';
  List<Meal> displayedMeals = [];
  bool _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final Map<String, String>? categoryArgs =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>?;
      category_name = categoryArgs?['title'] ?? "title";
      final String category_id = categoryArgs?['id'] ?? "id";
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(category_id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
      setState(() {
        displayedMeals.removeWhere((meal) {
              return meal.id == mealId;
        });
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(category_name),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
