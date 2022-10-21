import 'package:athkar/app/view/pages/athkar_page.dart';
import 'package:flutter/material.dart';

class MyAthkar extends StatelessWidget {
  final String title;
  final IconData icon;
  final double height;

  const MyAthkar({
    required this.title,
    required this.icon,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AthkarPage.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        width: 175,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
