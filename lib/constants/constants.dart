import 'package:flutter/material.dart';

class Dimensions {
  Dimensions._();
  static const dateBackgroundBlackColor = Color(0xff111111);
}

class AppColors {
  AppColors._();
  static const dateBackgroundBlackColor = Color(0xff111111);
  static const black50 = Color(0xff444444);
  static const black10 = Color(0xff656565);
  static const popOrange = Color(0xffFF4C00);

  static const textWhiteColor = Color(0xffFFFFFF);
  static const completeBackgroundColor = Color(0xffF0F2F5);

  static const firstStartBackgroundColor = Color(0xff3465C3);
  static const firstEndBackgroundColor = Color(0xff5785DE);

  static const secondStartBackgroundColor = Color(0xffEC4E27);
  static const secondEndBackgroundColor = Color(0xffF47E61);

  static const thirdStartBackgroundColor = Color(0xff6B34C3);
  static const thirdEndBackgroundColor = Color(0xff8E5EDB);

  static const grey100Color = Color(0xff9C9C9C);
  static const redBright = Color(0xffEC4E27);
  static const blueFaded = Color(0xff87C6F5);
}

class FontFamilies {
  FontFamilies._();
  static const matterFontFamily = 'Matter';
}

class AppPlatform {
  AppPlatform._();

  static bool isIOS(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS;
  }

  static bool isAndroid(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android;
  }
}

class AppBarHeight {
  AppBarHeight._();

  static double containerHiddenHeight(BuildContext context) {
    final value1 = MediaQuery.of(context).padding.top + kToolbarHeight;
    if (AppPlatform.isIOS(context)) {
      return 144.0;
    }
    return value1 + 36;
  }

  static double containerShownHeight(BuildContext context) {
    final value1 = MediaQuery.of(context).padding.top + kToolbarHeight;
    if (AppPlatform.isIOS(context)) {
      return 186.0;
    }
    return value1 + 80;
  }

  static double positionedShownTop(BuildContext context) {
    if (AppPlatform.isIOS(context)) {
      return 143.0;
    }
    final value1 = MediaQuery.of(context).padding.top + kToolbarHeight;
    return value1 + 38;
  }

  static double positionedHiddenTop(BuildContext context) {
    if (AppPlatform.isIOS(context)) {
      return 130.0;
    }
    return 100.0;
  }
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle? lightStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: FontFamilies.matterFontFamily,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    );
  }

  static TextStyle? regularStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: FontFamilies.matterFontFamily,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    );
  }

  static TextStyle? mediumStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: FontFamilies.matterFontFamily,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    );
  }

  static TextStyle? semiboldStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: FontFamilies.matterFontFamily,
      color: AppColors.dateBackgroundBlackColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
  }

  static TextStyle? boldStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: FontFamilies.matterFontFamily,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    );
  }

  static TextStyle? heavyStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: FontFamilies.matterFontFamily,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w800,
      fontSize: 18,
    );
  }
}
