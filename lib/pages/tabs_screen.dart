import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories_screen.dart';
import 'package:meals_app/pages/main_drawers.dart';

import '../models/meal.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorateMeals;
  const TabsScreen({super.key, required this.favorateMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];

  @override
  void initState() {
    _pages = [
      {
        'page': const CatergoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(favorates: widget.favorateMeals),
        'title': 'favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _pages[_selectedPageIndex]['title'].toString(),
            style: const TextStyle(fontWeight: FontWeight.w200),
          ),
          elevation: 0,
        ),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(
                  Icons.category_outlined,
                  color: Colors.white,
                ),
                activeIcon: const Icon(Icons.category),
                label: 'Categories',
                tooltip: 'Categories',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(
                  Icons.star_rate_outlined,
                  color: Colors.white,
                ),
                activeIcon: const Icon(Icons.star_rate),
                label: 'Favorites',
                tooltip: 'favorites',
              )
            ]));
  }
}
