import 'package:athkar/app/view/pages/counter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCounter extends StatelessWidget {
  final String title;
  final IconData icon;
  final double width;
  final double height;

  const MyCounter({
    required this.title,
    required this.icon,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MyCounterPage.routeName),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(title),
              ],
            ),
            Icon(
              icon,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
