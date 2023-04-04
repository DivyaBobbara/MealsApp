import 'package:flutter/material.dart';
import '../Screens/catergory_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({required this.id,required this.title,required this.color});

  void selectItem(BuildContext context) {
  // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //   return CategoryMealsScreen(category_id:id, category_name: title);
  // }
  // ));
// using named routes
  Navigator.of(context).pushNamed(
    CategoryMealsScreen.routeName,
    arguments: {
      'id': id,
      'title':title,
  },
  );

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectItem(context),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(title,style: Theme.of(context).textTheme.titleSmall,),
        // color: color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
