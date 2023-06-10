import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapWebViewWidget extends StatefulWidget {
  const MapWebViewWidget({
    Key? key,
    this.lat,
    this.long,
    this.url,
  }) : super(key: key);
  final String? lat;
  final String? long;
  final String? url;
  @override
  State<MapWebViewWidget> createState() => _MapWebViewWidgetState();
}

class _MapWebViewWidgetState extends State<MapWebViewWidget> {
  late final WebViewController controller;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    assert(widget.lat == null || widget.url == null,
        'Cannot set url when lat and long are provided.');
    assert(widget.long == null || widget.url == null,
        'Cannot set url when lat and long are provided.');
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xffffffff))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          setState(() {
            _isLoading = progress < 100;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _isLoading = false;
          });
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(widget.url != null
          ? Uri.parse(widget.url!)
          : Uri.parse(
              "https://www.google.com/maps/search/?api=1&query=${widget.lat ?? 0},${widget.long ?? 0}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خريطة القرية',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        shadowColor: Colors.green,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
