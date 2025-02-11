import 'package:dio/dio.dart';
import 'package:injectfy/injectfy.dart';

import '../controllers/motel_controller.dart';
import '../repositories/motel_repository.dart';
import '../repositories/motel_repository_impl.dart';

class Inject {
  static init() {
    final injectfy = Injectfy.instance;

    injectfy.registerSingleton<Dio>(() => Dio());
    injectfy.registerSingleton<MotelRepository>(
        () => MotelRepositoryImpl(injectfy()));
    injectfy
        .registerFactory<MotelController>(() => MotelController(injectfy()));
  }
}
