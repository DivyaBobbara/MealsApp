
import 'package:flutter/material.dart';
import 'package:meals/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title,IconData iconData, VoidCallback tapHandler) {
    return  ListTile(
      leading: Icon(
       iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 24,
          fontWeight: FontWeight.w700,

        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text('Cooking Up',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Theme.of(context).primaryColor),),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals',Icons.restaurant,() {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),

    );
  }
}
