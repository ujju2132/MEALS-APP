import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoesFree = false;

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
              _builderSwitchListTile(
                  'Lactose-Free', 'Only include lactose-free meals.', _lactoesFree,
                  (newvalue) {
                setState(
                  () {
                    _lactoesFree = newvalue;
                  },
                );
              }),
              _builderSwitchListTile(
                  'Vegan', 'Only include vegan meals.', _vegan,
                  (newvalue) {
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
