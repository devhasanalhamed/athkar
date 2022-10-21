import 'package:athkar/app/data/database/tasbih_database.dart';
import 'package:athkar/app/view/pages/athkar_page.dart';
import 'package:athkar/core/theme/data/dark_theme_data.dart';
import 'package:athkar/core/theme/data/light_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/view/pages/counter.dart';

import 'app/view/pages/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => TasbihDatabase(),
        ),
      ],
      child: MaterialApp(
        title: 'أذكار اليوم والليلة',
        theme: getLightThemeData(),
        darkTheme: getDarkThemeData(),
        themeMode: ThemeMode.system,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MyHomePage(),
        ),
        routes: {
          MyCounterPage.routeName : (context) => const MyCounterPage(),
          AthkarPage.routeName: (context) => const AthkarPage(),
        },
      ),
    );
  }
}

