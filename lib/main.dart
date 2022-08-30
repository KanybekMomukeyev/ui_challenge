import 'package:flutter/material.dart';
import 'package:flutterapp/main_screen.dart';
import 'package:flutterapp/main_blur_screen.dart';
import 'dart:ui';
import 'package:flutterapp/ui/bottom_navigation_bar.dart';
import 'package:flutterapp/ui/bottom_tab_bar.dart';

const MaterialColor whiteMaterial = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: whiteMaterial,
        brightness: Brightness.light,
      ),
      // home: const BottomTabbarExample(),
      home: const BottomNavigationBarExample(),
      // home: const MainScreenPage(),
      // home: const MainBlurScreen(),
    );
  }
}
