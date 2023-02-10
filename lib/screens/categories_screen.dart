import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
      ),
      children: DUMMY_CATEGORIES.map((e) => Container(
        padding: EdgeInsets.all(7),
        child: CategoryItem(e.id, e.title, e.color))).toList(),
    
      ),
    );
  }
}