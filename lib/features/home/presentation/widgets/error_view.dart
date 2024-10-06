
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
          child: Center(
            child: Container(
              height: 200,
              color: AppColors.red,
              child: Text(
                message,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
          ),
        );
  }
}