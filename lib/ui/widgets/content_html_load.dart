import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_quize/models/category.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ContentHtmlLoad extends StatefulWidget {
  final Category category;

  ContentHtmlLoad({required this.category});

  @override
  _ContentHtmlLoadState createState() => _ContentHtmlLoadState();
}

class _ContentHtmlLoadState extends State<ContentHtmlLoad> {

  late WebViewController _controller;

  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name+' Content'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    late String fileText;
    if(widget.category.id==9){
      fileText = await rootBundle.loadString('assets/html/genaral_knowlwedge_content.html');
    }else{
      return;
    }
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}


