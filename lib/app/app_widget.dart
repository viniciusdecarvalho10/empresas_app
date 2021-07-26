import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

import 'shared/helpers/constants.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Empresas',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Constants.SPLASH_ROUTE,
      builder: asuka.builder,
    ).modular();
  }
}
