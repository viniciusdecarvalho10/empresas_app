

import '../../../../shared/auth/models/auth_model.dart';
import '../models/post_signin_request.dart';

abstract class ISignInDatasource {
  Future<AuthModel> signin(PostSignInRequest auth);
}
