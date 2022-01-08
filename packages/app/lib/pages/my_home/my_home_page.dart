import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapb_theme/pages/my_home/my_home_controller.dart';
import 'package:yapb_theme/widgets/app_checkbox_list_tile.dart';
import 'package:yapb_theme/widgets/custom_button.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(myHomeControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Text button'),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated button'),
              ),
              const Divider(),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined button'),
              ),
              const Divider(),
              CustomButton(
                'Custom button',
                onPressed: () {},
              ),
              const Divider(),
              AppCheckboxListTile(
                isChecked: controller.checked.value,
                onChanged: (_) =>
                    controller.checked.value = !controller.checked.value,
                child: const Text('AppCheckBoxListTile'),
              ),
              const Divider(),
              const Text('You have pushed the button this many times:'),
              Text(
                '${controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.toggleTheme,
            tooltip: 'Change theme setting',
            child: controller.themeMode.value == ThemeMode.light
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
