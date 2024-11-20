import 'package:flutter/material.dart';
import 'package:todo_app/design/tokens/td_colors.dart';

const Color textColor = TdColors.brandPrimary_0;
const Color subTitleColor = Colors.grey;
const Color errorColor = Colors.red;
const ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: TdColors.brandPrimary_0,
  secondary: TdColors.brandPrimary_1,
  surface: TdColors.brandPrimary_1,
  error: errorColor,
  onPrimary: textColor,
  onSecondary: TdColors.brandPrimary_1,
  onSurface: textColor,
  onError: textColor,
);

const TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  ),
  displayMedium: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  ),
  displaySmall: TextStyle(
    fontSize: 14.0,
  ),
  bodyLarge: TextStyle(
    fontSize: 16.0,
    color: textColor,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    color: textColor,
  ),
  titleLarge: TextStyle(
    fontSize: 21.0,
    color: textColor,
  ),
  titleMedium: TextStyle(
    fontSize: 18.0,
    color: textColor,
  ),
  titleSmall: TextStyle(
    fontSize: 14.0,
    color: textColor,
  ),
  bodySmall: TextStyle(
    fontSize: 10.0,
    color: subTitleColor,
  ),
  labelLarge: TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  ),
  labelMedium: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  ),
  labelSmall: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
  ),
);
