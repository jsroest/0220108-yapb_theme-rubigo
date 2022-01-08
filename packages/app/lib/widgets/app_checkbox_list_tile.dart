import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapb_theme/classes/app_theme.dart';

class AppCheckboxListTile extends ConsumerWidget {
  const AppCheckboxListTile({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    required this.child,
  }) : super(key: key);

  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final Widget child;

  @override
  Widget build(context, ref) {
    return Material(
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor:
              Theme.of(context).appTheme.checkMarkBorderColor,
        ),
        child: CheckboxListTile(
          activeColor: Theme.of(context).appTheme.checkMarkColor,
          value: isChecked,
          onChanged: (value) => onChanged(value ?? false),
          controlAffinity: ListTileControlAffinity.leading,
          title: DefaultTextStyle.merge(
            style: isChecked
                ? TextStyle(
                    color: Theme.of(context).appTheme.checkMarkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )
                : const TextStyle(
                    fontSize: 16,
                  ),
            child: child,
          ),
          tileColor: isChecked
              ? Theme.of(context).appTheme.checkedTileColor
              : Theme.of(context).appTheme.uncheckedTileColor,
        ),
      ),
    );
  }
}
