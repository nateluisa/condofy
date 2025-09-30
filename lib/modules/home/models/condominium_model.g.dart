// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condominium_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Condominium on _CondominiumBase, Store {
  late final _$isFavoriteAtom =
      Atom(name: '_CondominiumBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$_CondominiumBaseActionController =
      ActionController(name: '_CondominiumBase', context: context);

  @override
  void setFavorite(bool value) {
    final _$actionInfo = _$_CondominiumBaseActionController.startAction(
        name: '_CondominiumBase.setFavorite');
    try {
      return super.setFavorite(value);
    } finally {
      _$_CondominiumBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite}
    ''';
  }
}
