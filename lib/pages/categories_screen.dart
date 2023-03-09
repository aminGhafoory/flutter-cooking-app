import 'package:meals_app/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/pages/category_item.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({super.key});

  @override
  String get tabName {
    return 'Categories';
  }

  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...dummyCategories
            .map((catData) => CategoryItem(
                  id: catData.id,
                  title: catData.title,
                  color: catData.color,
                ))
            .toList()
      ],
    );
  }
}
