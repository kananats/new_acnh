import 'package:flutter/material.dart';
import 'package:new_acnh/constant/color_constant.dart';

class ThemeConstant {
  static final theme = ThemeData(
    primarySwatch: ColorConstant.primarySwatch,
    appBarTheme: const AppBarTheme(),
    iconTheme: ThemeConstant.iconTheme,
    inputDecorationTheme: ThemeConstant.inputDecorationTheme,
    elevatedButtonTheme: ThemeConstant.elevatedButtonTheme,
    outlinedButtonTheme: ThemeConstant.outlinedButtonTheme,
    tabBarTheme: ThemeConstant.tabBarTheme,
    textTheme: const TextTheme(
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
    ),
  );

  static const iconTheme = IconThemeData();

  static const inputDecorationTheme = InputDecorationTheme();

  static const elevatedButtonTheme = ElevatedButtonThemeData();

  static const outlinedButtonTheme = OutlinedButtonThemeData();

  static const tabBarTheme = TabBarTheme();
}
