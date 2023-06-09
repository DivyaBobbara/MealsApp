import 'package:flutter/material.dart';
import 'package:meals/Screens/filters_screen.dart';
import 'package:meals/Screens/tabs_screen.dart';
import './Screens/meal_detail.dart';
import './Screens/catergory_meals_screen.dart';
import './dummy_data.dart';
import './Model/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _setFilters(Map<String,bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if( (_filters['gluten'] ?? false) && !meal.isGlutenFree) {
            return false;
        }
        if ((_filters['lactose'] ?? false) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] ?? false) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] ?? false) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });

  }

  void _toggleFavourite(String mealId) {
    final existingIndex = _favMeals.indexWhere((meal) {
        return (meal.id == mealId);
    });
    if(existingIndex >= 0 ) {
     setState(() {
       _favMeals.removeAt(existingIndex);
     });
    } else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal){
          return meal.id == mealId;
        }));
      });
    }
  }

  bool _isMealFav(String id) {
    return _favMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.red,
        primaryColor: Colors.yellow,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
         bodyLarge: TextStyle(
           color: Color.fromRGBO(20, 51, 51, 1)
         ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),

      ),
      // home: CategoriesScreen(),
      initialRoute: 'jhdkjshd',
      routes: {
        // '/': (context) => CategoriesScreen(),
        '/': (context) => TabsScreen(_favMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavourite,_isMealFav),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters,_filters),

      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      // },
    );
  }
}

