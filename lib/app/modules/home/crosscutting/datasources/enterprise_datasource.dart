import 'package:dio/native_imp.dart';

import '../../../../shared/helpers/app_errors.dart';
import '../../infra/datasources/enterprise_datasource_interface.dart';
import '../../infra/models/enterprise_model.dart';


class EnterpriseDatasource implements IEnterpriseDatasource {
  final DioForNative _dio;

  EnterpriseDatasource(this._dio);

  @override
  Future<List<EnterpriseModel>> get() async {
    final response = await _dio.get("/enterprises");
    var listEnterprise = <EnterpriseModel>[];
    if (response.statusCode == 200) {
      if (response.data.containsKey("enterprises") && response.data["enterprises"].isNotEmpty) {
        listEnterprise = (response.data["enterprises"] as List).map((e) => EnterpriseModel.fromMap(e)).toList();
      }

      return listEnterprise;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}
