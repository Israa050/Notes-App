

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/core/routes/routes.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset(AppAssets.notesAnimation,alignment: Alignment.center,),
     nextScreen: Container(),
     splashIconSize: 300,
     backgroundColor: AppColors.lightGrey,
     nextRoute: AppRoutes.homeRoute,
     ) ;
  }
}