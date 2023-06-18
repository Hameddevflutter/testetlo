import 'package:flutter/material.dart';

import '../services/theme_service.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.label,
    this.labelStyle,
    this.buttonColor,
    required this.onTap,
  });
  final String label;
  final TextStyle? labelStyle;
  final Color? buttonColor;
  final Function() onTap;
  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 148,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: buttonColor ?? ThemeService.green,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            label,
            style: labelStyle ??
                const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      );
}
