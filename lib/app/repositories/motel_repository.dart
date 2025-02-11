import 'package:resultfy/resultfy.dart';

import '../models/motel_model.dart';

abstract interface class MotelRepository {
  Future<Result<List<MotelModel>>> findAll();
}
