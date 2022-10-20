import 'package:athkar/core/theme/data/dark_theme_data.dart';
import 'package:athkar/core/theme/data/light_theme_data.dart';
import 'package:flutter/material.dart';

import 'app/view/pages/counter.dart';

import 'app/view/pages/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أذكار اليوم والليلة',
      theme: getLightThemeData(),
      darkTheme: getDarkThemeData(),
      themeMode: ThemeMode.system,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
      routes: {
        MyCounterPage.routeName : (context) => const MyCounterPage()
      },
    );
  }
}

