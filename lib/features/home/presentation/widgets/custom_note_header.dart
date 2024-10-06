

import 'package:flutter/material.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/dialogs.dart';
import 'icon_box.dart';

class CustomNoteHeader extends StatelessWidget {
  const CustomNoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          AppStrings.notesTitle,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 43,
          ),
        ),
        const Expanded(
            child: SizedBox(
          width: 50,
        )),
        iconBox(Icons.search,opTap: () {
          Navigator.of(context).pushNamed(AppRoutes.searchRoute);
        },),
        iconBox(Icons.info_outline,opTap: (){
          Dialogs.infoDailog(context);
        }),
      ],
    );
  }
}