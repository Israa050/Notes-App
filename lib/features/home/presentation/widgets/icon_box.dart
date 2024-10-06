import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

Widget iconBox(IconData icon,{double hight = 50 ,double width = 50,void Function()? opTap}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: GestureDetector(
      onTap: opTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          size: 24,
          color: AppColors.white,
        ),
      ),
    ),
  );
}
