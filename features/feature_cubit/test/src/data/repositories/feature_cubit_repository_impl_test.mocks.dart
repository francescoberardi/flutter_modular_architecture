// Mocks generated by Mockito 5.0.10 from annotations
// in feature_cubit/test/src/data/repositories/feature_cubit_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:feature_cubit/src/data/datasources/feature_cubit_local_data_source.dart'
    as _i5;
import 'package:feature_cubit/src/data/datasources/feature_cubit_remote_data_source.dart'
    as _i3;
import 'package:feature_cubit/src/data/models/feature_cubit_model.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared/src/network/network_info_impl.dart' as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeFeatureCubitModel extends _i1.Fake implements _i2.FeatureCubitModel {
}

/// A class which mocks [FeatureCubitRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockFeatureCubitRemoteDataSourceImpl extends _i1.Mock
    implements _i3.FeatureCubitRemoteDataSourceImpl {
  MockFeatureCubitRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.FeatureCubitModel> getFeatureCubitModel() =>
      (super.noSuchMethod(Invocation.method(#getFeatureCubitModel, []),
              returnValue:
                  Future<_i2.FeatureCubitModel>.value(_FakeFeatureCubitModel()))
          as _i4.Future<_i2.FeatureCubitModel>);
}

/// A class which mocks [FeatureCubitLocalDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockFeatureCubitLocalDataSourceImpl extends _i1.Mock
    implements _i5.FeatureCubitLocalDataSourceImpl {
  MockFeatureCubitLocalDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.FeatureCubitModel> getFeatureCubitModel() =>
      (super.noSuchMethod(Invocation.method(#getFeatureCubitModel, []),
              returnValue:
                  Future<_i2.FeatureCubitModel>.value(_FakeFeatureCubitModel()))
          as _i4.Future<_i2.FeatureCubitModel>);
}

/// A class which mocks [NetworkInfoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfoImpl extends _i1.Mock implements _i6.NetworkInfoImpl {
  MockNetworkInfoImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
