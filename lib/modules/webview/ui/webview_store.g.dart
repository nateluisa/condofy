// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebViewStore on _WebViewStoreBase, Store {
  late final _$loadingPercentageAtom =
      Atom(name: '_WebViewStoreBase.loadingPercentage', context: context);

  @override
  int get loadingPercentage {
    _$loadingPercentageAtom.reportRead();
    return super.loadingPercentage;
  }

  @override
  set loadingPercentage(int value) {
    _$loadingPercentageAtom.reportWrite(value, super.loadingPercentage, () {
      super.loadingPercentage = value;
    });
  }

  late final _$_WebViewStoreBaseActionController =
      ActionController(name: '_WebViewStoreBase', context: context);

  @override
  void setLoadingPercentage(int value) {
    final _$actionInfo = _$_WebViewStoreBaseActionController.startAction(
        name: '_WebViewStoreBase.setLoadingPercentage');
    try {
      return super.setLoadingPercentage(value);
    } finally {
      _$_WebViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingPercentage: ${loadingPercentage}
    ''';
  }
}
