import 'dart:math';
import 'package:flutter/material.dart';

class CustomColors {
  static var primary = const Color.fromARGB(1, 38, 164, 28);
  static var secondary = const Color.fromARGB(1, 0, 0, 0);
  static var primaryRed = const Color.fromARGB(1, 255, 79, 79);
  static var statsBackground = const Color.fromARGB(1, 32, 34, 34);
}

AppBar customAppBar(String title, BuildContext context) {
  return AppBar(
    title: Text(title),
    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
  );
}

String formatDate(DateTime dateTime) {
  dateTime = dateTime.toLocal();
  return "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour == 0 ? "12" : dateTime.hour}:${dateTime.minute < 10 ? "0${dateTime.minute}" : dateTime.minute.toString()} ${dateTime.hour >= 12 ? "pm" : "am"} on ${dateTime.day}/${dateTime.month}/${dateTime.year}";
}

Color hexToColor(String hexCode) {
  return Color(int.parse(hexCode.replaceFirst('#', '0xFF')));
}
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class NoScrollGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

bool isNullOREmpty(String? s) {
  return s == null || s.isEmpty || s == "null";
}

extension ChunkExtension<T> on List<T> {
  List<List<T>> chunk(int size) {
    return List.generate(
      (length + size - 1) ~/ size,
          (index) => sublist(index * size, min(length, (index + 1) * size)),
    );
  }
}