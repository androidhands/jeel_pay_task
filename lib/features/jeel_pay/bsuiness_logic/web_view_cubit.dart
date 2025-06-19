import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<WebViewState> {
  late final WebViewController controller;
  WebViewCubit() : super(WebViewInitial());

  /// TODO: search how to get web view height from java script
  void loadWebView() async {
    final PlatformWebViewControllerCreationParams params =
        const PlatformWebViewControllerCreationParams();

    controller = WebViewController.fromPlatformCreationParams(params);
    controller
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            emit(WebViewLoading());
            debugPrint('WebView is loading: $progress%');
          },
          onPageFinished: (String url) async {
          final hieght =   await _getWebViewHeight();
            emit(WebViewLoaded(height: hieght));
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            emit(WebViewError(message: error.description));
            debugPrint('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://jeel.co')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.navigate;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            emit(WebViewError(message: error.toString()));
            debugPrint('HTTP error: ${error.toString()}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..setOnScrollPositionChange((scrollPosition) {})
      ..loadRequest(Uri.parse('https://jeel.co'));
  }

  Future<double> _getWebViewHeight() async {
    try {
      final result = await controller
          .runJavaScriptReturningResult('document.body.scrollHeight');
      print('WebView height: $result');
      return double.tryParse(result.toString()) ?? 600.0;
    } catch (e) {
      debugPrint('Error getting web view height: $e');
      emit(WebViewError(message: e.toString()));
      throw Exception('Failed to get web view height: $e');
    }
  }
}
