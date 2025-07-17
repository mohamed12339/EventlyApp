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
    labelSmall: TextStyle(
      fontSize: 16,
      color: AppColors.black,
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

  static final lightDefaultTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: AppColors.gray),
  );
  static final darkDefaultTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: AppColors.gray),
  );

  static ThemeData lightTheme = ThemeData(///theme data: هيا عبارة عن انها بتشيل كل الستايلز بتاعة الابليكيشن كلو خطوط والوان كل حاجة وانا عملت تيكست سيم فوق لية عشان مكبرش الكود بس انتا ممكن تكتبوا جواها عادي بس
    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.blue,///دية معناها لون الي علي طول موجود في الابلكيشن كلو وانتا بتسخدموا علي طول

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),///دية معناها اني هديللك لون وطلع انتا منوا باقي الالوان التانية

    textTheme: _lightTextTheme,///دا تبع الي فوق يعني

    appBarTheme: AppBarTheme(///دا البار عادي بس بعمل الوان لية light and dark ورديس
      backgroundColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.blue)
        ),
        padding: EdgeInsets.symmetric(vertical: 16 ,) ,
         textStyle: TextStyle(
             color:  AppColors.white ,
             fontSize: 16 ,
             fontWeight: FontWeight.w500
         ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: lightDefaultTextBorder,
      focusedBorder: lightDefaultTextBorder,
      enabledBorder: lightDefaultTextBorder,
      hintStyle: _lightTextTheme.titleSmall,
      // prefixIconConstraints: BoxConstraints(maxHeight: 24, maxWidth: 24),///دول عشان اصغر ايكون صور الايميل والباسورد

    ),
    dividerTheme: DividerThemeData(color: AppColors.blue , thickness: 1)
  );

  static ThemeData darkTheme = ThemeData(///theme data: هيا عبارة عن انها بتشيل كل الستايلز بتاعة الابليكيشن كلو خطوط والوان كل حاجة وانا عملت تيكست سيم فوق لية عشان مكبرش الكود بس انتا ممكن تكتبوا جواها عادي بس
    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.blue,///دية معناها لون الي علي طول موجود في الابلكيشن كلو وانتا بتسخدموا علي طول
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),///دية معناها اني هديللك لون وطلع انتا منوا باقي الالوان التانية
    textTheme: _darkTextTheme,///دا تبع الي فوق يعني
    appBarTheme: AppBarTheme(///دا البار عادي بس بعمل الوان لية light and dark ورديس
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
    inputDecorationTheme: InputDecorationTheme(
      border: darkDefaultTextBorder,
      focusedBorder: darkDefaultTextBorder,
      enabledBorder: darkDefaultTextBorder,
    ),
  );
}
