import 'package:flutter_modular/flutter_modular.dart';

import 'crosscutting/datasources/signin_datasource.dart';
import 'domain/repositories/signin_repository_interface.dart';
import 'domain/usecases/interfaces/post_signin_interface.dart';
import 'domain/usecases/post_signin.dart';
import 'infra/datasources/signin_datasource_interface.dart';
import 'infra/repositories/signin_repository.dart';
import 'presenter/pages/signin/signin_controller.dart';
import 'presenter/pages/signin/signin_page.dart';

class OauthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignInController(i(), i())),
    Bind.lazySingleton<IPostSignIn>((i) => PostSignIn(i())),
    Bind.lazySingleton<ISignInRepository>((i) => SignInRepository(i())),
    Bind.lazySingleton<ISignInDatasource>((i) => SignInDatasource(i())),
  ];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => SignInPage())];
}
