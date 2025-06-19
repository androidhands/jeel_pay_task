import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeel_pay_task/features/jeel_pay/bsuiness_logic/web_view_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FirstPageCompoenet extends StatelessWidget {
  const FirstPageCompoenet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webViewCubit = context.read<WebViewCubit>();
    return BlocBuilder<WebViewCubit, WebViewState>(
      builder: (context, state) {
        if (state is WebViewLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WebViewError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is WebViewLoaded) {
          return Column(children: [
            Text("Hello Jeel Pay"),
            SizedBox(
              height: 10,
            ),
            Expanded(child: WebViewWidget(controller: webViewCubit.controller)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                webViewCubit.controller
                    .loadRequest(Uri.parse('https://jeel.co'));
              },
              child: const Text('Reload'),
            )
          ]);
        } else {
          return Center(
            child: Text(
              'WebView is not initialized',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
