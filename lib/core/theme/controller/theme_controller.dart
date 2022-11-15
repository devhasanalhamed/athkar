import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier{
  bool dark = false;
  get themeController => dark?ThemeMode.dark: ThemeMode.light;

  void toggleTheme(){
    if(themeController == ThemeMode.light){
      dark = true;
    }
    else{
      dark = false;
    }
    notifyListeners();
  }
}