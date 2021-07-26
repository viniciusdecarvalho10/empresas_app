import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/helpers/constants.dart';

class SplashController {
  SplashController();

  load() async {
    Future.delayed(Duration(seconds: 5)).then((value) => Modular.to.navigate(Constants.SIGNIN_ROUTE));
  }
}
