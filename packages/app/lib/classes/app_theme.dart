import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

extension AppTheme on ThemeData {
  AppThemeData get appTheme => brightness == Brightness.dark
      ? const AppThemeDataDark()
      : const AppThemeDataLight();
}

typedef FlexColorSchemeFactory = FlexColorScheme Function({
  double appBarElevation,
  FlexAppBarStyle appBarStyle,
  Color? background,
  double? bottomAppBarElevation,
  FlexSchemeColor? colors,
  String? fontFamily,
  Color? onBackground,
  Color? onError,
  Color? onPrimary,
  Color? onSecondary,
  Color? onSurface,
  TargetPlatform? platform,
  Color? scaffoldBackground,
  FlexScheme? scheme,
  Color? surface,
  FlexSurface surfaceStyle,
  bool swapColors,
  FlexTabBarStyle tabBarStyle,
  bool tooltipsMatchBackground,
  bool transparentStatusBar,
  Typography? typography,
  int usedColors,
  VisualDensity? visualDensity,
});

abstract class AppThemeData {
  const AppThemeData();

  //Define here all base colors for the theme
  final Color _basePrimaryColor = const Color(0xFF2A6BC8);
  final Color? _baseSecondaryColor = null;
  final Color? _baseErrorColor = const Color(0xFFBE4440);
  final Color _baseButtonColor = const Color(0xFF5CA37C);
  final Color? _baseTextButtonColor = const Color(0xFF1D509C);
  final Color? _baseDisabledButtonBackgroundColor = const Color(0xFFC2C2C2);
  final Color? _baseDisabledButtonForegroundColor = Colors.white;
  final Color _baseCheckedTileColor = const Color(0xFFE6F2FE);
  final Color? _baseUnCheckedTileColor = null;
  final Color? _baseCheckmarkColor = const Color(0xFF1D509C);
  final Color _baseCustomButtonColor = const Color(0xFF1D509C);
  final Color? _baseCheckmarkBorderColor = Colors.black;

  //This abstract getter is used to get FlexColorScheme.light or FlexColorScheme.dark
  FlexColorSchemeFactory get _flexColorSchemeFactory;

  //This abstract getter is used to have a consistent theme in light and dark mode
  ThemeData get _theme => _flexColorSchemeFactory(
        colors: FlexSchemeColor.from(
          primary: _basePrimaryColor,
          secondary: _baseSecondaryColor,
          error: _baseErrorColor,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ).toTheme.copyWith(
            elevatedButtonTheme: _elevatedButtonThemeData(),
            outlinedButtonTheme: _outlinedButtonThemeData(),
            textButtonTheme: _textButtonThemeData(),
          );

  //This is a customized ElevatedButtonTheme
  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return _disabledButtonBackgroundColor;
            } else {
              return _buttonColor;
            }
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return _disabledButtonForegroundColor;
            } else {
              return null;
            }
          },
        ),
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(48),
        ),
      ),
    );
  }

  //This is a customized OutlinedButtonTheme
  OutlinedButtonThemeData _outlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: _buttonColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        side: BorderSide(
          color: _buttonColor,
        ),
        minimumSize: const Size.fromHeight(48),
      ),
    );
  }

  //This is a customized TextButtonTheme
  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _textButtonColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        minimumSize: const Size(48, 48),
      ),
    );
  }

  //This abstract getter is used to define the button color for the elevatedButton and outlinedButton for light and dark mode
  Color get _buttonColor;

  //This abstract getter is used to define the text button color for the textButton for light and dark mode
  Color? get _textButtonColor;

  //This abstract getter is used to define the background color for a disabled elevatedButton for light and dark mode
  Color? get _disabledButtonBackgroundColor;

  //This abstract getter is used to define the foreground color for a disabled elevatedButton for light and dark mode
  Color? get _disabledButtonForegroundColor;

  //Define here all the custom properties for your app

  Color? get checkedTileColor;

  Color? get uncheckedTileColor;

  Color? get checkMarkColor;

  Color? get checkMarkBorderColor;

  Color? get customButtonColor;

  BorderSide? get customButtonBorderSide;
}

class AppThemeDataLight extends AppThemeData {
  const AppThemeDataLight();

  //Provide the light theme for the app
  ThemeData get theme => _theme;

  //Provide the factory constructor to be called when creating the theme
  @override
  FlexColorSchemeFactory get _flexColorSchemeFactory => FlexColorScheme.light;

  //Provide the button color for the elevatedButton and the outlinedButton for light mode
  @override
  Color get _buttonColor => _baseButtonColor;

  //Provide the text button color for the textButton for light mode
  @override
  Color? get _textButtonColor => _baseTextButtonColor;

  //Provide the background color for a disabled elevatedButton for light mode
  @override
  Color? get _disabledButtonBackgroundColor =>
      _baseDisabledButtonBackgroundColor;

  //Provide the foreground color for a disabled elevatedButton for light mode
  @override
  Color? get _disabledButtonForegroundColor =>
      _baseDisabledButtonForegroundColor;

  //Here are all the custom properties for your app
  @override
  Color? get checkedTileColor => _baseCheckedTileColor;

  @override
  Color? get uncheckedTileColor => _baseUnCheckedTileColor;

  @override
  Color? get checkMarkColor => _baseCheckmarkColor;

  @override
  Color? get checkMarkBorderColor => _baseCheckmarkBorderColor;

  @override
  Color? get customButtonColor => _baseCustomButtonColor;

  @override
  BorderSide? get customButtonBorderSide => BorderSide(
        color: _baseCustomButtonColor,
      );
}

class AppThemeDataDark extends AppThemeData {
  const AppThemeDataDark();

  //Provide the dark theme for the app
  ThemeData get theme => _theme;

  //Provide the factory constructor to be called when creating the theme
  @override
  FlexColorSchemeFactory get _flexColorSchemeFactory => FlexColorScheme.dark;

  //Provide the button color for the elevatedButton and the outlinedButton for dark mode
  @override
  Color get _buttonColor => _baseButtonColor.darken(15);

  //Provide the text button color for the textButton for dark mode
  @override
  Color? get _textButtonColor => null;

  //Provide the background color for a disabled elevatedButton for dark mode
  @override
  Color? get _disabledButtonBackgroundColor => null;

  //Provide the foreground color for a disabled elevatedButton for dark mode
  @override
  Color? get _disabledButtonForegroundColor => null;

  //Here are all the custom properties for your app
  @override
  Color? get checkedTileColor => _baseCheckedTileColor.darken(80);

  @override
  Color? get uncheckedTileColor => _baseUnCheckedTileColor;

  @override
  Color? get checkMarkColor => _baseCheckmarkColor;

  @override
  Color? get checkMarkBorderColor => null;

  @override
  Color? get customButtonColor => null;

  @override
  BorderSide? get customButtonBorderSide => null;
}
