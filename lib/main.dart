import 'package:flutter/material.dart';
import 'package:notes/app/app.dart';
import 'package:notes/core/configration/setup_hive.dart';

void main() async {
  await setupHive();
  runApp(MyApp());
}



