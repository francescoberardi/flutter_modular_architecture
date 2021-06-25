
/// Levels to control the logging output
enum LoggerLevel {
  /// verbose log level
  verbose,
  /// debug log level
  debug,
  /// info log level
  info,
  /// warning log level
  warning,
  /// error log level
  error,
  /// fatal log level
  fatal,
}

/// Abstract contract for implementing a logger library
abstract class AbstractLogger {

  /// Set the current logging level of the app
  /// All the output from logs with lower levels will be omitted
  void setMinimumLoggerLevel(LoggerLevel loggerLevel);

  /// Log a message at [LoggerLevel.verbose] level
  void verbose(String message);

  /// Log a message at [LoggerLevel.debug] level
  void debug(String message);

  /// Log a message at [LoggerLevel.info] level
  void info(String message);

  /// Log a message at [LoggerLevel.warning] level
  void warning(String message);

  /// Log a message at [LoggerLevel.error] level
  void error(String message);

  /// Log a message at [LoggerLevel.fatal] level
  void fatal(String message);

}
