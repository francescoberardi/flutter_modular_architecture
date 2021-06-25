import 'logger_util.dart';

abstract class AbstractLogger {

  void setMinimumLoggerLevel(LoggerLevel loggerLevel);

  void verbose(String message);

  void debug(String message);

  void info(String message);

  void warning(String message);

  void error(String message);

  void fatal(String message);

}
