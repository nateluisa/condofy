import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'webview_store.g.dart';

class WebViewStore = _WebViewStoreBase with _$WebViewStore;

abstract class _WebViewStoreBase with Store {
  late final WebViewController controller;

  @observable
  int loadingPercentage = 0;

  _WebViewStoreBase() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setLoadingPercentage(0);
          },
          onProgress: (progress) {
            setLoadingPercentage(progress);
          },
          onPageFinished: (url) {
            setLoadingPercentage(100);
          },
        ),
      )
      ..addJavaScriptChannel(
        'flutter_channel',
        onMessageReceived: (JavaScriptMessage message) {
          debugPrint("msg recebida do js: ${message.message}");
        },
      );
  }

  @action
  void setLoadingPercentage(int value) {
    loadingPercentage = value;
  }
}