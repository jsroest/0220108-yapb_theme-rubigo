import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapb_theme/classes/property.dart';

final myHomeControllerProvider = ChangeNotifierProvider(
  (ref) => MyHomeController(),
);

class MyHomeController extends ChangeNotifier {
  late final counter = Property(0, notifyListeners);
  late final themeMode = Property(ThemeMode.light, notifyListeners);
  late final checked = Property(false, notifyListeners);

  void incrementCounter() => counter.value++;

  void toggleTheme() {
    switch (themeMode.value) {
      case ThemeMode.system:
      case ThemeMode.light:
        themeMode.value = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        themeMode.value = ThemeMode.light;
        break;
    }
  }
}
