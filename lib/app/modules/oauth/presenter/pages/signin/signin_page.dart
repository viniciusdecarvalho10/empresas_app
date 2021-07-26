import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/auth/models/auth_model.dart';
import 'components/form/form_widget.dart';
import 'signin_controller.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ModularState<SignInPage, SignInController> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool _visibleKeyboard = !(MediaQuery.of(context).viewInsets.bottom == 0.0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: _size.height,
          child: Stack(children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: !_visibleKeyboard ? _size.height * 0.3 : _size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Center(
                              child: Image.asset(
                                'assets/images/logo_avatar.png',
                                scale: 3,
                              ),
                            ),
                            SizedBox(height: 15),
                            if (!_visibleKeyboard)
                              Text(
                                "Seja bem vindo ao empresas!",
                                style: TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: _size.height * .030, color: Colors.white),
                              ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(_size.width, 120)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/login_header.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _size.height * (!_visibleKeyboard ? 0.35 : 0.15),
                left: _size.height * 0.04,
                right: _size.height * 0.04,
              ),
              child: Observer(builder: (_) {
                return buildForm(controller.store.errorMsg, controller.store.state);
              }),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildForm(String? errorMsg, AuthModel model) {
    return FormWidget(
      isFormValid: controller.store.isFormValid,
      emailChanged: controller.setEmail,
      errorMsg: errorMsg,
      passwordChanged: controller.setPassword,
      loginPressed: () => controller.signIn(controller.store.login, controller.store.password, errorMsg),
    );
  }
}
