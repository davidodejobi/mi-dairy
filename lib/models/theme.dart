import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class NoteTheme with ChangeNotifier {
  NoteTheme();

  final lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff00296b),
      // primaryVariant: Color(0xff2f5c91),
      secondary: Color(0xffff7b00),
      // secondaryVariant: Color(0xfffdb100),
      appBarColor: Color(0xfff95738),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 18,
    appBarStyle: FlexAppBarStyle.primary,
    appBarOpacity: 0.95,
    appBarElevation: 0,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    tooltipsMatchBackground: true,
    swapColors: false,
    lightIsWhite: false,
    // useSubThemes: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use playground font, add GoogleFonts package and uncomment:
    // fontFamily: GoogleFonts.notoSans().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 0.95,
      navigationBarOpacity: 0.95,
      // navigationBarMutedUnselectedText: true,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );

  final darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xff6b8bc3),
      // primaryVariant: Color(0xff4874aa),
      secondary: Color(0xffff7155),
      // secondaryVariant: Color(0xfff1cb9d),
      appBarColor: Color(0xff892807),
      error: null,
    ),
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 18,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 0.95,
    appBarElevation: 0,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    tooltipsMatchBackground: true,
    swapColors: false,
    darkIsTrueBlack: false,
    // useSubThemes: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use playground font, add GoogleFonts package and uncomment:
    // fontFamily: GoogleFonts.notoSans().fontFamily,
    subThemesData: const FlexSubThemesData(
      useTextTheme: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarElevation: 0,
      bottomNavigationBarOpacity: 0.95,
      navigationBarOpacity: 0.95,
      // navigationBarMutedUnselectedText: true,
      navigationBarMutedUnselectedIcon: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      blendTextTheme: true,
      popupMenuOpacity: 0.95,
    ),
  );

  bool isDark = true;

  switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }

// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

}
