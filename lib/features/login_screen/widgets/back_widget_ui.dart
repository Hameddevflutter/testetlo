import 'package:flutter/material.dart';
import '../../../core/services/theme_service.dart';

class BackWidgetUi extends StatelessWidget {
  const BackWidgetUi({super.key});

  @override
  Widget build(final BuildContext context) => Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
            color: ThemeService.background,
            borderRadius: BorderRadius.circular(5)),
        child: const Icon(Icons.arrow_back),
      );
}
