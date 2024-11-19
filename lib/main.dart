import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

import 'pages/home.dart';
import 'utils/utils.dart';

void main() {
  WebViewPlatform.instance = WebWebViewPlatform();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: CustomColors.primary,
      theme: ThemeData.dark(
        useMaterial3: false
      ),
      home: const MyHomePage(),
    );
  }
}