import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Map<String, Object>> bottomNavigation = [
    {'icon': const Icon(Icons.home_rounded), 'label': 'Home'},
    {'icon': const Icon(Icons.menu_rounded), 'label': 'Categories'},
    {'icon': const Icon(Icons.search_rounded), 'label': 'Search'},
    {'icon': const Icon(Icons.favorite_border_rounded), 'label': 'Favorites'},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: bottomNavigation
          .map((navigation) => BottomNavigationBarItem(
              icon: navigation['icon'] as Widget,
              label: navigation['label'] as String))
          .toList(),
    );
  }
}
