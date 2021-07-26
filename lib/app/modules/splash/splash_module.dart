import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/splash/splash_controller.dart';
import 'presenter/pages/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => SplashPage())];
}
