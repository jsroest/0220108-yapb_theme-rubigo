import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapb_theme/classes/app_theme.dart';
import 'package:yapb_theme/pages/my_home/my_home_controller.dart';
import 'package:yapb_theme/pages/my_home/my_home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ref.watch(myHomeControllerProvider).themeMode.value,
      theme: const AppThemeDataLight().theme,
      darkTheme: const AppThemeDataDark().theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
