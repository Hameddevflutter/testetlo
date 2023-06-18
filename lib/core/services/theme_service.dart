// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

abstract class ThemeService {
  static Color get error => const Color(0xffe60000);
  static Color get background => const Color(0xfff2f2f2);
  static Color get white => Color.fromARGB(255, 255, 255, 255);
  static Color get borderColor => Color.fromARGB(255, 235, 235, 235);
  static Color get lightGray => const Color(0xFFADADAD);
  static Color get pendingColor => Color.fromARGB(255, 255, 187, 77);
  static Color get canceledColor => Color.fromARGB(255, 228, 1, 1);
  static Color get compeletedColor => Color.fromARGB(255, 6, 184, 0);

  static Color get shimmerBaseColor => Color.fromARGB(255, 240, 240, 240);

  static Color get remove => const Color(0xFFFB1B3B);
  static Color get red => const Color(0xffe60000);

  static Color get orange => const Color(0xfff7931d);

  static Color get hintText => const Color(0xFFBEBEBE);

  static Color get lightShadow => const Color(0x16000000);
  static Color get textColorBlack => Color.fromARGB(255, 0, 0, 0);
  static Color get textColorWhite => Color.fromARGB(255, 255, 255, 255);

  static Color get veryLightShadow => const Color(0x10000000);

  static Color get shadow => const Color(0x26000000);
  static Color get lightYellow => const Color(0xfff6b445);
  static Color get lightGrey => const Color(0xffa0a0a0);
  static Color get greenMed => const Color(0xff2D8B2D);
  static Color get green => const Color(0xff00AB4F);
  static Color get grey => const Color(0xff8f8f94);

  static Color get messageBackgroundColor => Color.fromARGB(41, 225, 225, 225);
  static Color get lightGreen =>
      const Color(0xffE5F5EF); //const Color(0xFF23DC3D);
  static Color get darkBorderColor =>
      const Color(0xff707070); //const Color(0xFF23DC3D);

  static Color get lightSuccess =>
      const Color(0xffe2fae9); //const Color(0xFF23DC3D);
}
