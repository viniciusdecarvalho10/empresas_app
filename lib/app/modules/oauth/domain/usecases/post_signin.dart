import 'package:dartz/dartz.dart';

import '../../../../shared/auth/models/auth_model.dart';
import '../../../../shared/helpers/app_errors.dart';
import '../../infra/models/post_signin_request.dart';
import '../errors/errors.dart';
import '../repositories/signin_repository_interface.dart';
import 'interfaces/post_signin_interface.dart';

class PostSignIn implements IPostSignIn {
  final ISignInRepository _signInRepository;

  PostSignIn(this._signInRepository);
  @override
  Future<Either<Failure, AuthModel>> call(PostSignInRequest resquest) async {
    if (!resquest.isValid) {
      return Left(FailurePostSignIn(message: 'Login ou senha esta com preenchimento inválido'));
    }

    try {
      return _signInRepository.signin(resquest);
    } on Exception {
      throw FailurePostSignIn(message: 'Erro ao realizar login');
    }
  }
}
