
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/utils/app_colors.dart';


part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject{
  
 
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? dateTime;
  @HiveField(3)
  int? color;
  // @HiveField(3)
  // Color? noteColor;

  Note({required this.title, required this.description, required this.dateTime,this.color,});

}