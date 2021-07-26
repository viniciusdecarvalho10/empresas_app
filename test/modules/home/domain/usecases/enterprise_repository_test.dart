import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:empresasapp/app/modules/home/infra/datasources/enterprise_datasource_interface.dart';
import 'package:empresasapp/app/modules/home/infra/models/enterprise_model.dart';
import 'package:empresasapp/app/modules/home/infra/repositories/enterprise_repository.dart';

class EnterpriseDatasourceMock extends Mock implements IEnterpriseDatasource {}
void main() {
  
  final dataSource = EnterpriseDatasourceMock();
  final repository = EnterpriseRepository(dataSource);

  test('deve retornar uma lista de enterprise', () async {
    when(dataSource.get()).thenAnswer((_) async => <EnterpriseModel>[]);

    final result = await repository.get();
    expect(result, isA<List<EnterpriseModel>>());
  });
}
