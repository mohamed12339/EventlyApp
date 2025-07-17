import 'package:flutter/material.dart';
import 'package:project_evently/ui/screens/splash/splash.dart';
import 'package:project_evently/ui/utlils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      home: const Splash(),

    );
  }
}
