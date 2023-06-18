import 'package:flutter/material.dart';

import '../services/theme_service.dart';

class SimpleBox extends StatelessWidget {
  const SimpleBox({
    required this.content,
    super.key,
    this.decoration,
  });

  final Widget content;
  final Decoration? decoration;

  @override
  Widget build(final BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 18),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).width * 0.16,
        alignment: Alignment.center,
        decoration: decoration ??
            BoxDecoration(
              border: Border.all(width: 2, color: ThemeService.borderColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
        child: content,
      );
}
