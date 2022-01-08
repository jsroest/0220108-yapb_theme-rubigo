import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapb_theme/classes/property.dart';

final myHomeControllerProvider = ChangeNotifierProvider(
  (ref) => MyHomeController(),
);

class MyHomeController extends ChangeNotifier {
  late final counter = Property(0, notifyListeners);

  void incrementCounter() => counter.value++;
}
