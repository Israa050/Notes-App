import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  int? maxLength;
  final String hint;
  double? fontSize;
  int? maxLines;
  void Function(String)? onChanged;
  CustomFormField(
      {super.key,
      required this.controller,
      this.maxLength,
      required this.hint,
      this.fontSize,
      this.maxLines,
      required this.onChanged});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: widget.controller,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: AppColors.grey,
          fontSize: widget.fontSize,
        ),
      ),
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required, cannot be empty!';
        } else {
          return null;
        }
      },
      style: TextStyle(
        color: AppColors.white,
        fontSize: widget.fontSize,
         shadows: [
        Shadow(
          offset: const Offset(1.0, 1.0,),
          blurRadius: 2.0,
          color: Colors.black.withOpacity(0.7,),
        ),
      ],
      ),
    );
  }
}
