import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logging;

class Logger {
  static final logging.Logger _internalLogger = logging.Logger('AppLogger');

  static void initialize() {
    logging.Logger.root.level = logging.Level.ALL;
    logging.Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        debugPrint(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
        );
      }
    });
  }

  static logging.Logger get instance => _internalLogger;
}