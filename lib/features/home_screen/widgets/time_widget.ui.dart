import 'package:flutter/material.dart';

import '../../../core/services/theme_service.dart';

class TimeWidgetUi extends StatelessWidget {
  const TimeWidgetUi({
    required this.onTap,
    required this.timeValue,
    super.key,
  });
  final Function() onTap;
  final String timeValue;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 140,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ThemeService.background,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            timeValue,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      );
}
