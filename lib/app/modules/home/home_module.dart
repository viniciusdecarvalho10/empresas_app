import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/auth/stores/auth_store.dart';
import '../../shared/helpers/constants.dart';

import 'crosscutting/datasources/enterprise_datasource.dart';
import 'domain/usecases/get_all_enterprise.dart';
import 'infra/repositories/enterprise_repository.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/stores/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController(i(), i(), i())),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => EnterpriseDatasource(i())),
    Bind.lazySingleton((i) => EnterpriseRepository(i())),
    Bind.lazySingleton((i) => GetAllEnterprise(i())),
  ];

  @override
  final List<ModularRoute> routes = [ChildRoute(Constants.HOME_ROUTE, child: (_, args) => HomePage())];
}
