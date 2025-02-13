import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PocketPage extends StatefulWidget {
  @override
  _PocketPageState createState() => _PocketPageState();
}

class _PocketPageState extends State<PocketPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://cosquinrock.net/billetera/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Billetera Cosquín Rock")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
