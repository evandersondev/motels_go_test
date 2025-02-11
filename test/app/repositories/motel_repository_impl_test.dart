import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_moteis_go/app/models/motel_model.dart';
import 'package:flutter_test_moteis_go/app/repositories/motel_repository.dart';
import 'package:flutter_test_moteis_go/app/repositories/motel_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resultfy/resultfy.dart';

import '../../mocks/motels_data.dart';

class DioClientMock extends Mock implements Dio {}

void main() {
  late MotelRepository sut;
  late Dio client;

  setUp(() {
    client = DioClientMock();
    sut = MotelRepositoryImpl(client);
  });

  test(
    'should be return a list of motels when success',
    () async {
      final mockResponse = Response(
        data: motelsData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(() => client.get('https://www.jsonkeeper.com/b/1IXK')).thenAnswer(
        (_) async => mockResponse,
      );

      final result = await sut.findAll();

      expect(result.isSuccess, isTrue);
      result.onSuccess((success) {
        expect(success, isA<List<MotelModel>>());
      });
    },
  );

  test(
    'should be return error when request failed',
    () async {
      when(() => client.get('https://www.jsonkeeper.com/b/1IXK'))
          .thenThrow(DioException(
        type: DioExceptionType.unknown,
        message: 'Erro de conexão',
        requestOptions: RequestOptions(path: ''),
      ));

      final result = await sut.findAll();

      expect(result.isFailure, isTrue);
      final failure = result as Failure;
      expect(
        failure.error.toString(),
        'Exception: Failed to fetch motels. Error: DioException [unknown]: Erro de conexão',
      );
    },
  );
}
