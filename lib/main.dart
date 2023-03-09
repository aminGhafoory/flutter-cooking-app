import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/pages/category_meals_screen.dart';
import 'package:meals_app/pages/filters_screen.dart';
import 'package:meals_app/pages/home_page.dart';
import 'package:meals_app/pages/meal_detail_screen.dart';
import 'package:meals_app/pages/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favorateMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where(
        (element) {
          if (_filters['gluten'] == true && !element.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] == true && !element.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] == true && !element.isVegan) {
            return false;
          }
          if (_filters['vegeterian'] == true && !element.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _toggleFavorate(Meal meal) {
    final existingIndex = _favorateMeals.indexWhere(
      (element) {
        return element.id == meal.id;
      },
    );
    setState(
      () {
        if (existingIndex == -1) {
          _favorateMeals.add(meal);
        } else {
          _favorateMeals.removeAt(existingIndex);
        }
      },
    );
  }

  bool _isFav(Meal meal) {
    return _favorateMeals.any((element) => element == meal) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealsApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 24,
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 20,
              ),
              titleLarge: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
              titleMedium: const TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
              ),
              titleSmall: const TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //home: const MealsApp(),
      routes: {
        '/': (context) => TabsScreen(favorateMeals: _favorateMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFav: _toggleFavorate,
              isFav: _isFav,
            ),
        FilterScreen.routeName: (context) =>
            FilterScreen(setFilters: _setFilters, currentFilters: _filters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => TabsScreen(favorateMeals: _favorateMeals));
      },
    );
  }
}
