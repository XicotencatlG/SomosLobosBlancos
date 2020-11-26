import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SGCE extends StatefulWidget {
  @override
  _SGCEState createState() => _SGCEState();
}

class _SGCEState extends State<SGCE> {
   Completer<WebViewController> _controller =Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
       initialUrl: 'http://189.195.154.210/toluca/servicios/',
        
      javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        }
      ),
    );
  }
}