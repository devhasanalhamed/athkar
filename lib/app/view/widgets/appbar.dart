import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const MyAppBar({
        required this.title,
        super.key});


  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 5,
      actions: [
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.sunny),
        ),
      ],
    );
  }

}