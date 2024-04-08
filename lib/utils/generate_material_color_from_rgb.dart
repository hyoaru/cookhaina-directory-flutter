import 'package:flutter/material.dart';

MaterialColor generateMaterialColorFromRGB(
    {required int red,
    required int green,
    required int blue,
    int primaryShade = 900}) {
  Map<int, Color> colorCodes = {};
  Map<int, int> shadeHexMap = {};
  const List<int> shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  double alpha = .1;
  for (var shade in shades) {
    Color color = Color.fromRGBO(red, green, blue, alpha);
    colorCodes[shade] = color;
    shadeHexMap[shade] = int.parse(
      color
      .toString()
      .substring(
        color.toString().indexOf('(') + 1, 
        color.toString().length - 1)
      );

    alpha += .1;
  }

  return MaterialColor(shadeHexMap[primaryShade]!, colorCodes);
}
