import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// App imports
import 'package:cookhaina_directory/constants/base/constants.dart';
import 'package:cookhaina_directory/widgets/base/bottom_nav_bar.dart';
import 'package:cookhaina_directory/pages/home.dart';
import 'package:cookhaina_directory/pages/categories.dart';
import 'package:cookhaina_directory/widgets/base/layout.dart';
import 'package:cookhaina_directory/pages/search.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  final List _pages = [
    const Home(),
    const Categories(),
    const Search(),
  ];

  void onNavigationChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          brightness: Brightness.light,
          primarySwatch: primarySwatch,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            'Cookhaina Directory',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: const Icon(Icons.view_week),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onNavigationChange: onNavigationChange,
        ),
        body: Layout(child: _pages[_selectedIndex]),
      ),
    );
  }
}
