import 'package:flutter/material.dart';
import 'package:project_evently/ui/utlils/app_colors.dart';

abstract final class AppTheme {
  static final TextTheme _lightTextTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 16,
      color: AppColors.gray,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
    ),

    titleMedium: TextStyle(
      fontSize: 20,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
  );
  static final TextTheme _darkTextTheme = TextTheme(
    titleSmall: TextStyle(
      fontSize: 16,
      color: AppColors.lightGrey,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
    ),

    titleMedium: TextStyle(
      fontSize: 20,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData lightTheme = ThemeData(///theme data: هيا عبارة عن انها بتشيل كل الستايلز بتاعة الابليكيشن كلو خطوط والوان كل حاجة وانا عملت تيكست سيم فوق لية عشان مكبرش الكود بس انتا ممكن تكتبوا جواها عادي بس
    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.blue,///دية معناها لون الي علي طول موجود في الابلكيشن كلو وانتا بتسخدموا علي طول

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),///دية معناها اني هديللك لون وطلع انتا منوا باقي الالوان التانية

    textTheme: _lightTextTheme, ///دا تبع الي فوق يعني

    appBarTheme: AppBarTheme( ///دا البار عادي بس بعمل الوان لية light and dark ورديس
      backgroundColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue),
    ),
  );
  static ThemeData darkTheme = ThemeData(///theme data: هيا عبارة عن انها بتشيل كل الستايلز بتاعة الابليكيشن كلو خطوط والوان كل حاجة وانا عملت تيكست سيم فوق لية عشان مكبرش الكود بس انتا ممكن تكتبوا جواها عادي بس
    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.blue,///دية معناها لون الي علي طول موجود في الابلكيشن كلو وانتا بتسخدموا علي طول

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),///دية معناها اني هديللك لون وطلع انتا منوا باقي الالوان التانية

    textTheme: _darkTextTheme, ///دا تبع الي فوق يعني

    appBarTheme: AppBarTheme( ///دا البار عادي بس بعمل الوان لية light and dark ورديس
      backgroundColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.blue),
    ),
  );
}
