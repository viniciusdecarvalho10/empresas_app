import 'package:dartz/dartz.dart';

import '../../../../../shared/auth/models/auth_model.dart';
import '../../../../../shared/helpers/app_errors.dart';
import '../../../infra/models/post_signin_request.dart';

abstract class IPostSignIn {
  Future<Either<Failure, AuthModel>> call(PostSignInRequest resquest);
}
