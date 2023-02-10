import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavouritesScreen(),
  ];

  int _selectedPageIndex = 0;

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
        title: Text('Meals'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).splashColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
