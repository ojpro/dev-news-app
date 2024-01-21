import 'package:flutter/material.dart';
import 'package:news_app/core/common/layouts/basic_layout.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String title;
  final String url;

  const WebViewScreen({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) =>
              NavigationDecision.prevent,
        ),
      )
      ..loadRequest(Uri.parse(url));

    return BasicLayout(
      title: title,
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
