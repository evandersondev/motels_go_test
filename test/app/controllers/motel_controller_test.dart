import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_moteis_go/app/controllers/motel_controller.dart';
import 'package:flutter_test_moteis_go/app/models/motel_model.dart';
import 'package:flutter_test_moteis_go/app/repositories/motel_repository.dart';
import 'package:flutter_test_moteis_go/app/states/motel_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resultfy/resultfy.dart';

class MotelRepositoryMock extends Mock implements MotelRepository {}

void main() {
  late MotelRepository repository;
  late MotelController sut;

  setUp(() {
    repository = MotelRepositoryMock();
    sut = MotelController(repository);
  });

  test(
    'should be a inital state controller',
    () {
      expect(sut.value, isA<InitialMotelState>());
    },
  );

  test(
    'should be success to load motels from repository',
    () async {
      final motels = [MotelModel.empty()];

      when(() => repository.findAll()).thenAnswer(
        (_) async => Success(motels),
      );

      await sut.load();

      expect(sut.value, isA<SuccessMotelState>());
      expect(sut.motels, equals(motels));
    },
  );

  test(
    'should be failure to load motels',
    () async {
      final error = Exception('Erro ao carregar motéis');

      when(() => repository.findAll()).thenAnswer(
        (_) async => Result.failure(error),
      );

      await sut.load();

      expect(sut.value, isA<FailureMotelState>());
      expect(
        (sut.value as FailureMotelState).message,
        'Exception: Erro ao carregar motéis',
      );
    },
  );

  test(
    'should be to show a loading state before to load motels',
    () async {
      when(() => repository.findAll()).thenAnswer(
        (_) async => Result.success([]),
      );

      sut.load();
      expect(sut.value, isA<LoadingMotelState>());
    },
  );
}
