import 'package:flutter/material.dart';
import '../Widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        children: dummy_categories.map(
                (data) => CategoryItem(id:data.id,title: data.title, color: data.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      );
  }
}
