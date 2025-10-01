import 'package:mobx/mobx.dart';

part 'condominium_model.g.dart';

class Condominium extends _CondominiumBase with _$Condominium {
  Condominium({
    required super.id,
    required super.name,
    required super.address,
  });
}

abstract class _CondominiumBase with Store {
  _CondominiumBase({
    required this.id,
    required this.name,
    required this.address,
  });

  final String id;
  final String name;
  final String address;

  @observable
  bool isFavorite = false;

  @action
  void setFavorite(bool value) {
    isFavorite = value;
  }
}