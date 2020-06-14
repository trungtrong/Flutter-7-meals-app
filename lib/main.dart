import 'package:flutter/material.dart';
//
import 'package:flutter_personal_expenses_app/models/meal_model.dart';
//
import 'package:flutter_personal_expenses_app/screens/category_meals_screen.dart';
import 'package:flutter_personal_expenses_app/screens/filter_screen.dart';
import 'package:flutter_personal_expenses_app/screens/meal_detail_screen.dart';
import 'package:flutter_personal_expenses_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  List<Meal> _favoriteMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Deli Meals',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
            ),

            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
            ),
            
            // title => headline6
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20
            ) 
          ),
        ),

        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text("Flutter App")
        //   ),
        //   body: Container()
        // ),

        // Routing
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite, isFavorite),
          FiltersScreen.routeName: (context) => FiltersScreen()
        },
    );
  }
}