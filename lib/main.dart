import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/configration/setup_hive.dart';

void main() async {
  await setupHive();
  runApp(MyApp());
}



