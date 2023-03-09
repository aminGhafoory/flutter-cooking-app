import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  Widget buildListTile(Icon icon, String title, void Function()? func) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w300),
      ),
      onTap: func,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          buildListTile(
            const Icon(Icons.restaurant_menu_sharp),
            'meal',
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            const Icon(Icons.filter_alt_outlined),
            'Filters',
            () => Navigator.of(context)
                .pushReplacementNamed(FilterScreen.routeName),
          ),
        ],
      ),
    );
  }
}
