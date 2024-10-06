import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomColorContainer extends StatelessWidget {
  Border? border;
  Color? color = AppColors.lightPurple;
  CustomColorContainer({super.key, this.border, this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.bounceInOut,
      margin: const EdgeInsets.all(10),
     // padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color
            blurRadius: 5, // Softness of the shadow
            spreadRadius: 1, // Size of the shadow
            offset: const Offset(4, 4), // Shadow position
          ),
          ],
        ),
      ),
    );
  }
}
