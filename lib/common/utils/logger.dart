import 'package:logger/logger.dart';

class HobbyLog {
  late Logger logger;

  static final HobbyLog _instance = HobbyLog._internal();

  factory HobbyLog() {
    return _instance;
  }

  d(String message) {
    logger.d(message);
  }

  i(String message) {
    logger.i(message);
  }

  e(String message) {
    logger.e(message);
  }

  changeLoggingEnable() {
    logger = Logger(filter: LogEnableFilter());
  }

  HobbyLog._internal() {
    logger = Logger(printer: PrettyPrinter(methodCount: 0));
  }
}

class LogEnableFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
