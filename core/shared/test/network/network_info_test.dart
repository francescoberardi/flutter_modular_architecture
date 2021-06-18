import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/src/network/network_info.dart';

class MockConnectivity extends Mock implements Connectivity {
  @override
  Future<bool> checkConnection() {
    return Future.value(true);
  }
}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectivity: mockConnectivity);
  });

  group('isConnected', () {
    test(
      'should forward the call to Connectivity.checkConnection',
      () async {
        // act
        final result = networkInfo.isConnected;
        // assert
        verify(mockConnectivity.isConnected);
        expect(result, Future.value(true));
      },
    );
  });
}
