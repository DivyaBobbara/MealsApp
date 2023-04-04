import 'package:flutter/material.dart';
import 'package:meals/Screens/categories_screen.dart';
import 'package:meals/Screens/favourites_screen.dart';
import 'package:meals/Widgets/main_drawer.dart';
import '../Model/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages = [];

  int _selectedPageIndex = 0;
  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });

  }
  @override
  void initState() {
    _pages = [
      {'page':CategoriesScreen(),'title':'Categories'},
      {'page':FavouritesScreen(widget.favouriteMeals),'title':'Favourites'},
      {'page':CategoriesScreen(),'title':'Logout'},
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedPageIndex,
        backgroundColor: Colors.grey,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourites'),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: 'LogOut'),

        ],
        type: BottomNavigationBarType.shifting,
      ),
    );
    //   DefaultTabController(length: 2, child: Scaffold(
    //   appBar: AppBar(title: Text('TabBarTitle'),
    //   bottom: const TabBar(tabs: [
    //     Tab(icon:Icon(Icons.category),text: 'Categories',),
    //     Tab(icon:Icon(Icons.star),text: 'Favourites',),
    //   ],
    //   ),
    //   ),
    //   body: TabBarView(children: <Widget>[
    //       const CategoriesScreen(),
    //     FavouritesScreen(),
    //   ]),
    // ),
    // // initialIndex: 1,
    // );
  }
}
