import 'package:athkar/app/view/widgets/appbar.dart';
import 'package:athkar/app/view/widgets/counter.dart';
import 'package:athkar/app/view/widgets/information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/athkar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const myAppBar = MyAppBar(
    title: 'أذكار اليوم والليلة',
    isHomePage: true,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.02),
        child: ListView(
          children: [
            MyInformation(
              title: 'معلومات',
              icon: FontAwesomeIcons.info,
              width: double.infinity,
              height: screenHeight * 0.20,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            MyCounter(
              title: 'السبحة الإلكترونية',
              icon: FlutterIslamicIcons.solidTasbih2,
              width: double.infinity,
              height: screenHeight * 0.25,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            SizedBox(
              height: screenHeight * 0.44,
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  mainAxisExtent: ((MediaQuery.of(context).size.width / 2) -
                      screenHeight * 0.03),
                ),
                children: [
                  MyAthkar(
                    title: 'أذكار الصباح',
                    icon: Icons.sunny,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'أذكار المساء',
                    icon: Icons.nightlight_round,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'الذكر بعد الصلاة',
                    icon: FlutterIslamicIcons.prayingPerson,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'أذكار النوم',
                    icon: Icons.bed,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'أذكار',
                    icon: Icons.sunny,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'أذكار',
                    icon: Icons.sunny,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'أذكار',
                    icon: Icons.sunny,
                    height: screenHeight * 0.20,
                  ),
                  MyAthkar(
                    title: 'أذكار',
                    icon: Icons.sunny,
                    height: screenHeight * 0.20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
