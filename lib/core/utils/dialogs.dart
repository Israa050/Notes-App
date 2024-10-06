import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';

abstract class Dialogs {
  static void infoDailog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(
        milliseconds: 400,
      ),
      pageBuilder: (context, animation1, animation2,) {
        return Container();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child,) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation,),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation,),
            child: AlertDialog(
              titleTextStyle: const TextStyle(color: AppColors.white,),
              contentTextStyle: const TextStyle(color: AppColors.white,),
              title: const Text('Notes App 📝',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
              content: RichText(
                text: const TextSpan(
                  text: 'Developed by:\n',
                  style: TextStyle(fontSize: 16,),
                  children: [
                    TextSpan(
                      text: 'Israa Essa 👩🏻‍💻',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              backgroundColor: AppColors.lightGrey,
            ),
          ),
        );
      },
    );
  }
}
