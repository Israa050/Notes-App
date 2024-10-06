

import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class SearchFailureView extends StatelessWidget {
  final String assetName;
  String? message;
  SearchFailureView({super.key, required this.assetName,this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.darkGrey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      Center(
                        child: Image.asset(
                          assetName,
                          height: 300
                          // 286.73,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                       message?? '',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
          ),
      );
  }
}