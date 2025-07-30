
import 'package:flutter/material.dart';

class IntroDM {
  final String title;
  final String subtitle;
  final String Function(ThemeMode mode )imagePath;


  IntroDM({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}