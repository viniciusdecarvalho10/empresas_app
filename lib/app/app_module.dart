import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/oauth/oauth_module.dart';
import 'modules/splash/splash_module.dart';
import 'shared/auth/stores/auth_store.dart';
import 'shared/components/password_text_form_field/password_text_form_field_controller.dart';
import 'shared/helpers/constants.dart';
import 'shared/helpers/dio_base/dio_custom.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.factory((i) => PasswordTextFormFieldController()),
    Bind.lazySingleton((i) => DioCustom(i(), i())),
    Bind.lazySingleton((i) => BaseOptions(
          baseUrl: Constants.BASE_URL,
          connectTimeout: 5000,
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Constants.SPLASH_ROUTE, module: SplashModule()),
    ModuleRoute(Constants.SIGNIN_ROUTE, module: OauthModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
