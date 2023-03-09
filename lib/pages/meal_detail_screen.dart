import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';
  final void Function(Meal) toggleFav;
  final bool Function(Meal) isFav;
  const MealDetailScreen(
      {super.key, required this.toggleFav, required this.isFav});
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(isFav(meal) ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            toggleFav(meal);
          },
        ),
        appBar: AppBar(
          title: Text(
            meal.title,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 200,
                width: 350,
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: const Color.fromRGBO(255, 217, 218, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        meal.ingredients[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  itemCount: meal.ingredients.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: 450,
                  width: 350,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text(
                            meal.steps[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(255, 217, 218, 1),
                        )
                      ],
                    ),
                    itemCount: meal.steps.length,
                  )),
            ],
          ),
        ));
  }
}
