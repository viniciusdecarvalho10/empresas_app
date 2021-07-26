import 'package:mobx/mobx.dart';
import '../../auth/models/auth_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String login = '';
  @observable
  String password = '';

  @observable
  String errorMsg = '';
  @observable
  AuthModel state = AuthModel();

  @action
  void setEmail(String value) => login = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setLogin(AuthModel value) => state = value;

  @action
  void setErrorMsg(String value) => errorMsg = value;

  @action
  void clear() => state = AuthModel();

  @computed
  bool get isEmailValid => RegExp("[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(login);

  @computed
  bool get isPasswordValid => password.length >= 3;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
