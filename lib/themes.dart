import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

final ThemeData _myDarkTheme = FlexThemeData.dark(
  scheme: FlexScheme.greenM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
final ThemeData _myLightTheme = FlexThemeData.light(
  scheme: FlexScheme.greenM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = _myDarkTheme;
  ThemeData get theme => _theme;
  void toggleTheme() {
    final isDark = _theme == _myDarkTheme;
    if (isDark) {
      _theme = _myLightTheme;
    } else {
      _theme = _myDarkTheme;
    }
    notifyListeners();
  }
}
