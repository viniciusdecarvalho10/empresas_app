import '../../../../shared/helpers/app_errors.dart';

abstract class FailureSignIn implements Failure {}

class FailurePostSignIn implements FailureSignIn {
  @override
  final String? message;
  FailurePostSignIn({
    this.message,
  });
}

class SignInRepostoryError implements FailureSignIn {
  @override
  final String? message;
  SignInRepostoryError({
    this.message,
  });
}
