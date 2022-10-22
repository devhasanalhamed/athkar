import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHomePage;
  final String? value;

  const MyAppBar({required this.title, required this.isHomePage,this.value, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  static const sizeFromHeight = Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      elevation: 0.0,
      actions: isHomePage
          ? [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.sunny),
              ),
            ]
          : [Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('$value',textDirection:TextDirection.ltr,),
          ))],
      centerTitle: isHomePage? false:true,
    );
  }
}
