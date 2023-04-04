import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = "FiltersScreen";
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;

    super.initState();
  }

  Widget _buildSwitchListTile(String title,String subTitle,bool currentVal,Function(bool) updateValue) {
    return  SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(subTitle),
      onChanged:  updateValue,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text('Your Filters'),actions: [
          IconButton(onPressed:(){
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,
            };
            widget.saveFilters(selectedFilters);


          }, icon: Icon(Icons.save)),
        ],),

          drawer: MainDrawer(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Expanded(
                  child: ListView(
                    children: [
                      _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newVal) {
                        setState(() {
                          _glutenFree = newVal;
                        });
                      }),
                      _buildSwitchListTile('Lactose-free', 'Only include lactose-free meals', _lactoseFree, (newVal) {
                        setState(() {
                          _lactoseFree = newVal;
                        });
                      }),
                      _buildSwitchListTile('Vegetarian', 'Only include Vegetarian meals', _vegetarian, (newVal) {
                        setState(() {
                          _vegetarian = newVal;
                        });
                      }),
                      _buildSwitchListTile('Vegan', 'Only include Vegan meals', _vegan, (newVal) {
                        setState(() {
                          _vegan = newVal;
                        });
                      }),
                    ],
                  ),
              ),
            ],
          ),

      ),
    );
  }
}
