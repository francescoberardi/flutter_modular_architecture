import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';

import 'package:feature_cubit/src/domain/entities/feature_cubit_entity.dart';
import 'package:feature_cubit/src/domain/usecases/feature_cubit_usecases.dart';
import 'package:feature_cubit/src/presentation/cubit/feature_cubit.dart';
import 'package:shared/shared.dart';

import 'feature_cubit_test.mocks.dart';

/// Initial test for cubit
@GenerateMocks([FeatureCubitUseCase])
void main() {
  late MockFeatureCubitUseCase mockFeatureCubitUseCase;
  late FeatureCubit cubit;

  setUp(() {
    mockFeatureCubitUseCase = MockFeatureCubitUseCase();
    cubit = FeatureCubit(useCase: mockFeatureCubitUseCase);
  });

  test('first state should be initial', () {
    expect(cubit.state, equals(isA<FeatureCubitInitial>()));
  });

  group('getFeatureCubitEntitiesToState', () {
    final tFeatureCubitEntity = FeatureCubitEntity();

    test('should get data for correct flow', () async {
      when(mockFeatureCubitUseCase(any))
          .thenAnswer((_) async => Right(tFeatureCubitEntity));

      expectLater(
          cubit.stream,
          emitsInOrder([
            FeatureCubitLoading(),
            FeatureCubitLoaded(featureCubitEntity: tFeatureCubitEntity)
          ]));

      cubit.getFeatureCubitEntitiesToState();
    });

    test('should return error if something went wrong', () async {
      final String errorMessage = 'Something went wrong';

      when(mockFeatureCubitUseCase(any))
          .thenAnswer((_) async => Left(LocalFailure(errorMessage)));

      expectLater(
          cubit.stream,
          emitsInOrder([
            FeatureCubitLoading(),
            FeatureCubitError(message: errorMessage)
          ]));

      cubit.getFeatureCubitEntitiesToState();
    });
  });
}
