part of 'theme_manager.dart';

TextTheme _textTheme(bool dark) => TextTheme(
      displayLarge: GoogleFonts.poppins(
          fontSize: 26.sp,
          fontWeight: FontWeight.bold,
          color: dark ? ColorManagerDark.mainYellow : ColorManager.mainYellow),
      displayMedium: GoogleFonts.alegreyaSans(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: dark ? ColorManagerDark.whiteColor : ColorManager.whiteColor),
      displaySmall: GoogleFonts.alegreyaSans(
          //used
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: dark ? ColorManagerDark.mainBlue : ColorManager.mainBlue),
      headlineMedium: GoogleFonts.alegreyaSans(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: dark ? ColorManagerDark.mainYellow : ColorManager.mainYellow),
      bodySmall: GoogleFonts.alegreyaSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4.sp,
          color: dark ? ColorManagerDark.whiteColor : ColorManager.whiteColor),
      titleMedium: GoogleFonts.alegreyaSans(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: dark ? ColorManagerDark.whiteColor : ColorManager.whiteColor),
      titleSmall: GoogleFonts.alegreyaSans(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: dark ? ColorManagerDark.mainYellow : ColorManager.mainYellow),
      labelLarge: GoogleFonts.alegreyaSans(
          fontSize: 16.sp, fontWeight: FontWeight.w500),
      labelSmall: GoogleFonts.alegreyaSans(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5.sp,
          color: dark ? ColorManagerDark.blackColor : ColorManager.blackColor),
    );
