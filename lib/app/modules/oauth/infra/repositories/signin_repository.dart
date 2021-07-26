import 'package:dartz/dartz.dart';

import '../../../../shared/auth/models/auth_model.dart';
import '../../../../shared/helpers/app_errors.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/signin_repository_interface.dart';
import '../datasources/signin_datasource_interface.dart';
import '../models/post_signin_request.dart';

class SignInRepository implements ISignInRepository {
  final ISignInDatasource _dataSource;

  SignInRepository(this._dataSource);

  @override
  Future<Either<Failure, AuthModel>> signin(PostSignInRequest resquest) async {
    try {
      final result = await _dataSource.signin(resquest);

      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    } on Exception catch (error) {
      return Left(SignInRepostoryError(message: error.toString()));
    }
  }
}
