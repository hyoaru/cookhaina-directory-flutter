import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onNavigationChange;
  const BottomNavBar({super.key, required this.onNavigationChange, required this.selectedIndex});

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
      currentIndex: widget.selectedIndex,
      onTap: widget.onNavigationChange,
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

