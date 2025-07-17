import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_evently/ui/utlils/app_assets.dart';
import 'package:project_evently/ui/utlils/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2 ) , (){ ///تكملة الشرح في الكشكول
      Navigator.push(context, AppRoutes.login); //دية موجودة شرح في الكشكول وفي فايل ال appRoutes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splashScreen,
        width: double.infinity, /// عشان تاخخد العرض كلو وبرد لو حطيت لون في السكفولد يظهر
        fit: BoxFit.cover,
      ),
    );
  }
}
