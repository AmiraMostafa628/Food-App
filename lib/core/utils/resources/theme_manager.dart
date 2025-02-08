import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/assets_manager.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';

ThemeData getAppTheme()
{
  return ThemeData(
    fontFamily: FontFamily.sen,
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        color: ColorManager.white,),
      bodyMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: ColorManager.labelColor),

      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: ColorManager.restaurantTitleColor,
      ),

      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorManager.textColor,
      ),

      bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff646982),
      ),

      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: ColorManager.white,
      ),
      displayMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xff7E8A97),
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: ColorManager.primaryColor,
      ),


    ),


  );
}
