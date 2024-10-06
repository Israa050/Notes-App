
import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';

Widget customFloatingActionButton({required void Function()? onPressed,IconData icon = Icons.add}){
  return FloatingActionButton(
        elevation: 6,
        backgroundColor: AppColors.white,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: AppColors.darkBlack,
          size: 30,
        ),
      );
}