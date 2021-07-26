import 'package:dio/native_imp.dart';

import '../../../../shared/auth/models/auth_model.dart';
import '../../../../shared/helpers/app_errors.dart';
import '../../infra/datasources/signin_datasource_interface.dart';
import '../../infra/models/post_signin_request.dart';

class SignInDatasource implements ISignInDatasource {
  final DioForNative _dio;

  SignInDatasource(this._dio);

  Future<AuthModel> signin(PostSignInRequest auth) async {
    final response = await _dio.post("/users/auth/sign_in", queryParameters: {"email": auth.login, "password": auth.password});

    if (response.statusCode == 200 && response.data['success']) {
      var model = AuthModel.fromHeader(response.headers);
      var investor = AuthModel.fromMap(response.data);
      model = model.copyWith(
        name: investor.name,
        email: auth.login,
        password: auth.password,
      );
      return model;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}