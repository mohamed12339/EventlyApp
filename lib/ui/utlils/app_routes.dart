import 'package:flutter/material.dart';
import 'package:project_evently/ui/screens/add_event/add_event.dart';
import 'package:project_evently/ui/screens/home/home.dart';
import 'package:project_evently/ui/screens/register/register.dart';
import '../screens/login/login.dart';

abstract final class AppRoutes{ ///شرح ال set and get في الكشكول
  static Route get login {
    return MaterialPageRoute(builder: (_) => Login()); /// MaterialPageRoute :  routes وبتعمل  main dart هيا هيا الي كنت بتعملها في
  }

  static Route get home {
    return MaterialPageRoute(builder: (_) => Home());
  }

  static Route get register {
    return MaterialPageRoute(builder: (_) => Register());
  }

  static Route get addEvent {
    return MaterialPageRoute(builder: (_) => AddEvent());
  }
}