import 'package:athkar/core/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHomePage;

  const MyAppBar({required this.title, required this.isHomePage, super.key});

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
                onPressed: () {
                  Provider.of<ThemeController>(context,listen: false).toggleTheme();
                },
                icon: const Icon(Icons.sunny),
              ),
            ]
          : null,
      centerTitle: isHomePage? false:true,
    );
  }
}
