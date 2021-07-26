import 'package:asuka/asuka.dart' as asuka;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/auth/stores/auth_store.dart';
import '../../../../../shared/components/loading_progress_indicator/loading_progress_indicator_widget.dart';
import '../../../../../shared/helpers/constants.dart';
import '../../../domain/usecases/interfaces/post_signin_interface.dart';
import '../../../infra/models/post_signin_request.dart';

class SignInController {
  final IPostSignIn _postSignIn;
  final AuthStore store;

  SignInController(this._postSignIn, this.store);

  void setError(String value) => store.setErrorMsg(value);
  void setEmail(String value) => store.setEmail(value);
  void setPassword(String value) => store.setPassword(value);

  Future<void> signIn(String login, String password, String? errorMsg) async {
    var overlay = OverlayEntry(
      builder: (context) {
        return LoadingProgressIndicatorWidget(
          isCustom: true,
        );
      },
    );
    asuka.addOverlay(overlay);
    await Future.delayed(Duration(seconds: 2));
    var request = PostSignInRequest(login: login, password: password);

    var result = await _postSignIn(request);
    result.fold((response) => {if (response.message == Constants.ERROR_401) store.setErrorMsg(Constants.ERROR_401_SIGNIN) else store.setErrorMsg(Constants.ERROR_SIGNIN)}, (user) async {
      store.setLogin(user);
    });

    overlay.remove();
    if (result is Right) {
      store.setErrorMsg('');
      Modular.to.navigate(Constants.HOME_ROUTE);
    }
  }
}
