import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages =[];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {
      'page': FavouritesScreen(widget.favouriteMeals),
      'title': 'Your Favourites',
    },
  ];
    // TODO: implement initState
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(length: 2,
    // child: Scaffold(
    //   appBar: AppBar(title: Text('Meals'),
    //   bottom: TabBar(tabs:
    //   [
    //     Tab(
    //       icon: Icon(Icons.category,),
    //       text: 'Categories',
    //     ),
    //     Tab(
    //       icon: Icon(Icons.star),
    //       text: 'Favourites',
    //     ),
    //   ]
    //   ),),
    //   body: TabBarView(children: [
    //     CategoriesScreen(),
    //     FavouritesScreen(),
    //   ]),
    // ));

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).splashColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
