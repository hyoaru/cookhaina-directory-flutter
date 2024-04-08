import 'package:flutter/material.dart';

// App imports
import 'package:cookhaina_directory/utils/generate_material_color_from_rgb.dart';
import 'package:cookhaina_directory/widgets/base/bottom_nav_bar.dart';
import 'package:cookhaina_directory/pages/home.dart';

void main() {
  MaterialColor primarySwatch = generateMaterialColorFromRGB(
    red: 33,
    green: 33,
    blue: 33,
    primaryShade: 900,
  );

  runApp(MaterialApp(
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
      bottomNavigationBar: const BottomNavBar(),
      body: Scaffold(
        body: SafeArea(
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Home(),
          ),
        ),
      ),
    ),
  ));
}
