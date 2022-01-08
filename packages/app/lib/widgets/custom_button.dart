import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapb_theme/classes/app_theme.dart';

class CustomButton extends ConsumerWidget {
  const CustomButton(
    this.text, {
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(context, ref) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.all(8),
        side: Theme.of(context).appTheme.customButtonBorderSide,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Theme.of(context).appTheme.customButtonColor,
        ),
      ),
      icon: Icon(
        Icons.flag,
        color: Theme.of(context).appTheme.customButtonColor,
      ),
      onPressed: onPressed,
    );
  }
}
