import 'package:flutter/material.dart';

import '../models/motel_model.dart';
import '../repositories/motel_repository.dart';
import '../states/motel_state.dart';

class MotelController extends ValueNotifier<MotelState> {
  final MotelRepository _repository;

  MotelController(this._repository) : super(InitialMotelState());

  List<MotelModel> motels = [MotelModel.empty()];

  Future<void> load() async {
    value = LoadingMotelState();

    final result = await _repository.findAll();

    result.onSuccess((success) {
      value = SuccessMotelState();
      motels = success;
    });

    result.onFailure((error) {
      value = FailureMotelState(error.toString());
    });
  }
}
