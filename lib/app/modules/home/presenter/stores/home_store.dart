import 'package:mobx/mobx.dart';

import '../../domain/entities/enterprises_entity.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<EnterpriseEntity> enterprises = <EnterpriseEntity>[].asObservable();

  @observable
  ObservableList<EnterpriseEntity> enterprisesFiltered = <EnterpriseEntity>[].asObservable();

  @observable
  EnterpriseEntity enterpriseSelected = EnterpriseEntity();

  @action
  void setEnterprises(List<EnterpriseEntity> value) => enterprises = value.asObservable();

  @action
  void setEnterprisesFiltered(List<EnterpriseEntity> value) => enterprisesFiltered = value.asObservable();

  @action
  void setEnterpriseSelected(EnterpriseEntity value) => enterpriseSelected = value;
}
