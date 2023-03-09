import 'package:flutter/material.dart';
import 'package:meals_app/pages/main_drawers.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen({
    super.key,
    required this.setFilters,
    required this.currentFilters,
  });

  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegeterian = widget.currentFilters['vegeterian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    void Function(bool)? ontap,
    bool value,
  ) {
    return SwitchListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        value: value,
        onChanged: ontap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian
                };
                widget.setFilters(selectedFilters);
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "adjust your Selection",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten Free', 'only show gluten free meals if enabled', (p0) {
              setState(() {
                _glutenFree = p0;
              });
            }, _glutenFree),
            _buildSwitchListTile(
                'Vegeterian', 'only show vegeterian meals if enabled', (p0) {
              setState(() {
                _vegeterian = p0;
              });
            }, _vegeterian),
            _buildSwitchListTile(
                'Vegan', 'only show gluten Vegan meals if enabled', (p0) {
              setState(() {
                _vegan = p0;
              });
            }, _vegan),
            _buildSwitchListTile(
                'Lactose Free', 'only show lactose free meals if enabled',
                (p0) {
              setState(() {
                _lactoseFree = p0;
              });
            }, _lactoseFree),
          ],
        ))
      ]),
    );
  }
}
