import 'package:feature1/src/domain/entities/feature1_entity.dart';
import 'package:feature1/src/domain/usecases/feature1_usecase.dart';
import 'package:feature1/src/presentation/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart';

import 'feature1_bloc_test.mocks.dart';

@GenerateMocks([Feature1UseCase])
void main() {
  late Feature1Bloc bloc;
  late MockFeature1UseCase mockFeature1UseCase;

  setUp(() {
    mockFeature1UseCase = MockFeature1UseCase();
    bloc = Feature1Bloc(
      feature1UseCase: mockFeature1UseCase,
    );
  });

  test('First state should be Empty', () {
    // assert
    expect(bloc.state, equals(Empty()));
  });

  group('LoadFeature1Entity', () {
    final tFeature1Entity = Feature1Entity();

    test(
      'should get data from the concrete use case',
      () async {
        // arrange
        when(mockFeature1UseCase(any))
            .thenAnswer((_) async => Right(tFeature1Entity));
        // act
        bloc.add(LoadFeature1Entity());
        await untilCalled(mockFeature1UseCase(any));
        // assert
        verify(mockFeature1UseCase(any));
      },
    );

    test(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockFeature1UseCase(any))
            .thenAnswer((_) async => Right(tFeature1Entity));
        // assert later
        final expected = [
          Loading(),
          Loaded(feature1entity: tFeature1Entity),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(LoadFeature1Entity());
      },
    );

    test(
      'Should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        final message = 'Server Exception';
        when(mockFeature1UseCase(any))
            .thenAnswer((_) async => Left(ServerFailure(message)));
        // assert later
        final expected = [
          Loading(),
          Error(message: message),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(LoadFeature1Entity());
      },
    );
  });
}
