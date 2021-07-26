// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$enterprisesAtom = Atom(name: '_HomeStoreBase.enterprises');

  @override
  ObservableList<EnterpriseEntity> get enterprises {
    _$enterprisesAtom.reportRead();
    return super.enterprises;
  }

  @override
  set enterprises(ObservableList<EnterpriseEntity> value) {
    _$enterprisesAtom.reportWrite(value, super.enterprises, () {
      super.enterprises = value;
    });
  }

  final _$enterprisesFilteredAtom =
      Atom(name: '_HomeStoreBase.enterprisesFiltered');

  @override
  ObservableList<EnterpriseEntity> get enterprisesFiltered {
    _$enterprisesFilteredAtom.reportRead();
    return super.enterprisesFiltered;
  }

  @override
  set enterprisesFiltered(ObservableList<EnterpriseEntity> value) {
    _$enterprisesFilteredAtom.reportWrite(value, super.enterprisesFiltered, () {
      super.enterprisesFiltered = value;
    });
  }

  final _$enterpriseSelectedAtom =
      Atom(name: '_HomeStoreBase.enterpriseSelected');

  @override
  EnterpriseEntity get enterpriseSelected {
    _$enterpriseSelectedAtom.reportRead();
    return super.enterpriseSelected;
  }

  @override
  set enterpriseSelected(EnterpriseEntity value) {
    _$enterpriseSelectedAtom.reportWrite(value, super.enterpriseSelected, () {
      super.enterpriseSelected = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setEnterprises(List<EnterpriseEntity> value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setEnterprises');
    try {
      return super.setEnterprises(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnterprisesFiltered(List<EnterpriseEntity> value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setEnterprisesFiltered');
    try {
      return super.setEnterprisesFiltered(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnterpriseSelected(EnterpriseEntity value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setEnterpriseSelected');
    try {
      return super.setEnterpriseSelected(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enterprises: ${enterprises},
enterprisesFiltered: ${enterprisesFiltered},
enterpriseSelected: ${enterpriseSelected}
    ''';
  }
}
