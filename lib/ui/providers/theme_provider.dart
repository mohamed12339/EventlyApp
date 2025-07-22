import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light ; ///انا كدا بقولوا يعني لونوا واغيروا بفانكشن

 changeMode(ThemeMode mode){
   this.mode = mode ;
   notifyListeners();

 }
}