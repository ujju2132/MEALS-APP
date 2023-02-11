import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) return false;
        if (_filters['lactose'] as bool && !element.isLactoseFree) return false;
        if (_filters['vegan'] as bool && !element.isVegan) return false;
        if (_filters['vegetarian'] as bool && !element.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.amber,
            primarySwatch: Colors.pink,
            cardColor: Color.fromRGBO(244, 243, 223, 1)),
        canvasColor: Color.fromRGBO(255, 254, 217, 1),
        splashColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          // bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontWeight: FontWeight.bold,),
          // bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontWeight: FontWeight.bold,),
          // titleLarge: TextStyle(
          //   fontSize: 20,
          //   fontFamily: 'RobotoCondensed',
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (Context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_isMealFavorite,_toggleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
      // },
      // onUnknownRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
      // },
    );
  }
}
