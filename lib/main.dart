import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'features/home_screen/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          fontFamily: "Yekan",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: DepartmentPage(),
        ),
      );
}
