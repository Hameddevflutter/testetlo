// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/theme_service.dart';

class MainItemUiWidget extends StatelessWidget {
  const MainItemUiWidget({
    required this.controller,
    required this.index,
    super.key,
  });
  final controller;
  final int index;
  @override
  Widget build(final BuildContext context) => Container(
        height: MediaQuery.sizeOf(context).width * 0.33,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ThemeService.borderColor, width: 1),
        ),
        child: Row(
          children: [
            SvgPicture.network(
              controller.departments[index].icon,
              placeholderBuilder: (final context) =>
                  const CircularProgressIndicator(),
              height: 60,
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.departments[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/calender.svg',
                      height: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.46,
                      child: Text(
                        controller.departments[index].details,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: ThemeService.lightGray),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/location.svg',
                      height: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ترکیه - استانبول",
                      style: TextStyle(color: ThemeService.lightGray),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/svg/edit.svg',
              height: 24,
            )
          ],
        ),
      );
}
