import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/stores/auth_store.dart';
import '../../app_errors.dart';
import '../../constants.dart';

class InterceptorsCustom extends InterceptorsWrapper {
  final AuthStore store;

  InterceptorsCustom({required this.store});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    var accessToken = store.state.apiToken;
    var client = store.state.client;
    var uid = store.state.uid;

    if (accessToken.isNotEmpty) {
      options.headers.addAll({
        "Content-Type": "application/json",
        "access-token": accessToken,
        "client": client,
        "uid": uid,
      });
    }

    handler.next(options);
  }

  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    DioFailure failure;
    if (err.response?.statusCode == 401) {
      failure = DioFailure(
        err,
        msg: Constants.ERROR_401,
      );
      store.clear();
      Modular.to.navigate(Constants.SIGNIN_ROUTE);
    } else {
      failure = DioFailure(err, msg: Constants.ERROR_500);
    }

    handler.next(failure);
  }
}
