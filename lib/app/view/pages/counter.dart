import 'package:athkar/app/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MyCounterPage extends StatefulWidget {
  static String routeName = 'counter-page' ;
  const MyCounterPage({Key? key}) : super(key: key);

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'السبحة الإلكترونية',isHomePage: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        ),
      ),
    );
  }
}
