/// Abstract class for network info
abstract class NetworkInfo {
  /// Check if device is connected to internet
  Future<bool> get isConnected;
}
