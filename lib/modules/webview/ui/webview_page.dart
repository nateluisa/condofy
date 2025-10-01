import 'package:condofy/modules/webview/ui/webview_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final WebViewStore store = GetIt.I<WebViewStore>();

  final String urlToLoad = 'https://www.condofy.com.br/?gad_source=1&gad_campaignid=1646876088&gbraid=0AAAAADBoAwqI5tCeBZ50f7R9hFYpWHtCc&gclid=CjwKCAjw_-3GBhAYEiwAjh9fULoHHiVI8STJF7zmYpreVK1QKjZAgRADYIuL_q4iJ-8RSBToWInliRoCg8AQAvD_BwE';

  @override
  void initState() {
    super.initState();
    _setupWebView();
  }

  void _setupWebView() {
    store.controller.loadRequest(Uri.parse(urlToLoad));

    store.controller.addJavaScriptChannel(
      'flutter_channel',
      onMessageReceived: (JavaScriptMessage message) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("recebeu o evento: ${message.message}")),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Condofy'), centerTitle: true,),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              WebViewWidget(controller: store.controller),
              if (store.loadingPercentage < 100)
                LinearProgressIndicator(value: store.loadingPercentage / 100.0),
            ],
          );
        },
      ),
    );
  }
}
