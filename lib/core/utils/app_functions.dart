
import 'package:flutter/material.dart';
import 'dart:math' as math;

abstract class AppFunctions {

  static String get currentDate => DateTime.now().toIso8601String();

  

}


extension on List<Color>{
  Color get randomColor {
    var ran = math.Random();
    return this[ran.nextInt(length-1)];
  }
}