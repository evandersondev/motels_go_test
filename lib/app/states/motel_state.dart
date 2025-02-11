sealed class MotelState {}

final class InitialMotelState extends MotelState {}

final class LoadingMotelState extends MotelState {}

final class SuccessMotelState extends MotelState {}

final class FailureMotelState extends MotelState {
  final String message;

  FailureMotelState(this.message);
}
