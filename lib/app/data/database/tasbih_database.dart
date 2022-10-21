import 'package:flutter/material.dart';

import '../models/tasbih.dart';


class TasbihDatabase with ChangeNotifier {
  List<Tasbih> tasbihList = [
    Tasbih(name: 'سبحان الله', maxNumber: 33),
    Tasbih(name: 'الحمد لله', maxNumber: 33),
    Tasbih(name: 'لا إله إلا الله', maxNumber: 33),
    Tasbih(name: 'الله أكبر', maxNumber: 33),
  ];
}