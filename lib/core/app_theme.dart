import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.canvasDark,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.brandDark,
      onPrimary: AppColors.textOnBrandDark,
      secondary: AppColors.accentDark,
      onSecondaryContainer: AppColors.textBrandDark,
      secondaryContainer: AppColors.brandSubtleDark,
      onSecondary: AppColors.textOnBrandDark,
      shadow: AppColors.overlayDark,
      outlineVariant: AppColors.borderSubtleDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      error: AppColors.dangerDark,
      onError: AppColors.textOnDangerDark,
      onSurfaceVariant: AppColors.textSecondaryDark,
      seedColor: AppColors.brandDark,
      outline: AppColors.borderDefaultDark,
      brightness: Brightness.dark,

    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
        letterSpacing: -0.5,
        color: AppColors.textPrimaryDark,
      ),

      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimaryDark,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimaryDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimaryDark,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimaryDark,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accentDark,
      selectionHandleColor: AppColors.accentDark,
      selectionColor: AppColors.accentDark.withValues(alpha: 0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.disabledDark,
        disabledForegroundColor: AppColors.textDisabledDark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.canvasDark,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textBrandDark,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.canvasLight,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(
        primary: AppColors.brandLight,
      onPrimary: AppColors.textOnBrandLight,
      secondary: AppColors.accentLight,
      onSecondaryContainer: AppColors.textBrandLight,
      secondaryContainer: AppColors.brandSubtleLight,
      onSecondary: AppColors.textOnBrandLight,
      shadow: AppColors.overlayLight,
      outlineVariant: AppColors.borderSubtleLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textPrimaryLight,
      error: AppColors.dangerLight,
      onError: AppColors.textOnDangerLight,
      onSurfaceVariant: AppColors.textSecondaryLight,
      seedColor: AppColors.brandLight,
      outline: AppColors.borderDefaultLight,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
        letterSpacing: -0.5,
        color: AppColors.textPrimaryLight,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimaryLight,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryLight,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimaryLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimaryLight,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimaryLight,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accentLight,
      selectionHandleColor: AppColors.accentLight,
      selectionColor: AppColors.accentLight.withValues(alpha: 0.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.disabledLight,
        disabledForegroundColor: AppColors.textDisabledLight,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.canvasLight,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textBrandLight,
      ),
    ),
  );
}
