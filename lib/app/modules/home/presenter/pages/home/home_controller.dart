import '../../../../../shared/auth/stores/auth_store.dart';

import '../../../domain/entities/enterprises_entity.dart';

import '../../../domain/usecases/interfaces/get_all_enterprise_interface.dart';
import '../../stores/home_store.dart';

class HomeController {
  final IGetAllEnterprise _getAllEnterprise;
  final HomeStore store;
  final AuthStore authStore;

  HomeController(
    this._getAllEnterprise,
    this.store,
    this.authStore,
  ) {
    getEnterprises();
  }

  Future<void> getEnterprises() async {
    var result = await _getAllEnterprise();
    result.fold((l) => {null}, (enterprises) {
      store.setEnterprises(enterprises);
      store.setEnterprisesFiltered(enterprises);
    });
  }

  void getEnterprisesFiltered(String _text) {
    if (_text.isNotEmpty) {
      final enterprisesFiltered = <EnterpriseEntity>[];
      for (final enterprise in store.enterprises) {
        final enterpriseName = enterprise.enterpriseName.toLowerCase();
        if (enterpriseName.contains(_text.toLowerCase())) {
          enterprisesFiltered.add(enterprise);
        }
      }
      store.setEnterprisesFiltered(enterprisesFiltered);
    } else {
      store.setEnterprisesFiltered(store.enterprises);
    }
  }
}
