import 'package:flutter/material.dart';

import 'package:meals_app/pages/meal_tile.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  final List<Meal> availableMeals;
  const CategoryMealsScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle ?? " "),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.builder(
          //padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return MealTile(meal: categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
