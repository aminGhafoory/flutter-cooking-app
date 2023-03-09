import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorates;
  const FavoritesScreen({super.key, required this.favorates});
  String get tabName {
    return 'favorites';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(favorates[index].title),
      ),
      itemCount: favorates.length,
    ));
  }
}
