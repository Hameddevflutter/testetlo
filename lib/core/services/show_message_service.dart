// ignore_for_file: avoid_classes_with_only_static_members

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'theme_service.dart';

class ShowMessageService {
  static showSuccessMsg(final message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 3),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      contentColor: ThemeService.green,
      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
    );
  }

  static showMsg(final message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 5),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      contentColor: ThemeService.grey,
      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
    );
  }

  static showErrorMsg(final message) {
    BotToast.showText(
      text: message,
      duration: const Duration(seconds: 5),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      contentColor: ThemeService.red,
      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
    );
  }

  static showLoading() {
    BotToast.showLoading(duration: const Duration(seconds: 6));
  }

  static showWarningMsg(final message, {final int? duration}) {
    BotToast.showText(
      text: message,
      duration: Duration(seconds: duration ?? 4),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      contentColor: ThemeService.orange,
      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
    );
  }
}
