import 'package:flutter/foundation.dart';

@immutable
class PostSignInRequest {
  final String login;
  final String password;

  PostSignInRequest({
    required this.login,
    required this.password,
  });

  bool get isValid => login.isNotEmpty && password.isNotEmpty;
}
