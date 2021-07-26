import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import '../../auth/stores/auth_store.dart';
import 'interceptors/interceptor_custom.dart';

class DioCustom extends DioForNative {
  final AuthStore _store;

  DioCustom(this._store, [BaseOptions? options]) : super(options) {
    interceptors.add(InterceptorsCustom(store: _store));
  }
}
