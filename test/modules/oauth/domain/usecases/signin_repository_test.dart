import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:empresasapp/app/modules/oauth/domain/errors/errors.dart';
import 'package:empresasapp/app/modules/oauth/infra/datasources/signin_datasource_interface.dart';
import 'package:empresasapp/app/modules/oauth/infra/models/post_signin_request.dart';
import 'package:empresasapp/app/modules/oauth/infra/repositories/signin_repository.dart';
import 'package:empresasapp/app/shared/auth/models/auth_model.dart';

class SignInDatasourceMock extends Mock implements ISignInDatasource {}
void main() {
  
  final dataSource = SignInDatasourceMock();
  final repository = SignInRepository(dataSource);

  AuthModel authModel = AuthModel();

  test('deve realizar o sign in e retornar tokens e usuario', () async {
    var request = PostSignInRequest(login: "testeapple@ioasys.com.br", password: "12341234");
    when(dataSource.signin(request)).thenAnswer((_) async => authModel);

    final result = await repository.signin(request);
    expect(result, isA<AuthModel>());
    expect(result.getOrElse(() => authModel), isA<AuthModel>());
  });

  test('deve retornar FailurePostSignIn caso o login ou senha seja vazio', () async {
    var requestInvalid = PostSignInRequest(login: "", password: "");
    when(dataSource.signin(requestInvalid)).thenAnswer((_) async => authModel);
    final result = await repository.signin(requestInvalid);

    expect(result.fold(id, id), isA<FailurePostSignIn>());

  });
}
