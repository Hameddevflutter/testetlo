// ignore_for_file: avoid_classes_with_only_static_members

import 'package:logger/logger.dart';

class LoggerService {
  static Logger logger = Logger(
    filter: MyFilter(),
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false, // Should each log print contain a timestamp
    ),
  );
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(final LogEvent event) => true;
}
