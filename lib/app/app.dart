



import 'package:flutter/material.dart';
import 'package:notes/core/routes/app_router.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

