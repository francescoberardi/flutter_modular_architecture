import 'dart:io';

import 'network_info.dart';

/// Default implementations of NetworkInfo
class NetworkInfoImpl extends NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}
    return false;
  }
}
