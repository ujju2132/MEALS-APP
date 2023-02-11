import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
          cardColor: Color.fromRGBO(244, 243, 223, 1)          
        ),
        canvasColor:  Color.fromRGBO(255, 254, 217, 1),
        splashColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme:TextTheme(
            displayLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontWeight: FontWeight.bold,),
            titleLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontWeight: FontWeight.bold,),
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
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (Context) => CategoryMealsScreen(),
        MealDetailScreen.routeName:(context) => MealDetailScreen(),
        FiltersScreen.routeName:(context) => FiltersScreen(),
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
