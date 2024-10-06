
import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'dart:math' as math;

Color randomColor(){
  List colors = AppColors.colors;
  var random = math.Random();
  return colors[random.nextInt(colors.length-1)];
}