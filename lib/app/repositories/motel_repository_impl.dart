import 'package:dio/dio.dart';
import 'package:resultfy/resultfy.dart';

import '../models/motel_model.dart';
import '../repositories/motel_repository.dart';

class MotelRepositoryImpl implements MotelRepository {
  final Dio _client;

  MotelRepositoryImpl(this._client);

  @override
  Future<Result<List<MotelModel>>> findAll() async {
    try {
      final response = await _client.get('https://www.jsonkeeper.com/b/1IXK');
      final motels = response.data['data']['moteis'] as List;

      return Success(motels.map((it) => MotelModel.fromMap(it)).toList());
    } catch (e) {
      return Failure(
          Exception('Failed to fetch motels. Error: ${e.toString()}'));
    }
  }
}
