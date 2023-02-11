import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoesFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoesFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _builderSwitchListTile(
    String title,
    String description,
    bool currentValue,
    upadteValue,
  ) {
    return SwitchListTile(
      activeColor: Colors.amber,
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: upadteValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoesFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _builderSwitchListTile('Lactose-Free',
                  'Only include lactose-free meals.', _lactoesFree, (newvalue) {
                setState(
                  () {
                    _lactoesFree = newvalue;
                  },
                );
              }),
              _builderSwitchListTile(
                  'Vegan', 'Only include vegan meals.', _vegan, (newvalue) {
                setState(
                  () {
                    _vegan = newvalue;
                  },
                );
              }),
              _builderSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (newvalue) {
                setState(
                  () {
                    _vegetarian = newvalue;
                  },
                );
              }),
              _builderSwitchListTile(
                  'Gluten-Free', 'Only include gluten-free meals.', _glutenFree,
                  (newvalue) {
                setState(
                  () {
                    _glutenFree = newvalue;
                  },
                );
              }),
            ],
          ))
        ],
      ),
    );
  }
}
