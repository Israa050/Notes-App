
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/features/home/logic/cubit/notes_cubit.dart';
import 'package:notes/features/home/presentation/widgets/custom_color_container.dart';

class CustomColorsRow extends StatefulWidget {
  final int index;
  const CustomColorsRow({super.key, required this.index});

  @override
  State<CustomColorsRow> createState() => _CustomColorsRowState();
}

class _CustomColorsRowState extends State<CustomColorsRow> {
  Border border =  Border.all(color: AppColors.darkBlack,width: 2,);

  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppColors.colors.length,
        itemBuilder: (context,index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              BlocProvider.of<NotesCubit>(context).changeBackgroundColor(AppColors.colors[selectedIndex]);
              setState(() {});
            },
            child: CustomColorContainer(
              color: AppColors.colors[index],
              border: selectedIndex==index? border:null,
            ),
          );
        }
      ),
    );
  }
}