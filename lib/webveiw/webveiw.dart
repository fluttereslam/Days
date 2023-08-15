
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatefulWidget {
  //const webView({Key? key}) : super(key: key);
  late  String url;
  webView(this.url);

  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
