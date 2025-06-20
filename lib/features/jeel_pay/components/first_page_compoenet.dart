import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeel_pay_task/features/jeel_pay/bloc/web_view_cubit.dart';
import 'package:jeel_pay_task/features/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FirstPageCompoenet extends StatelessWidget {
  const FirstPageCompoenet({super.key});

  @override
  Widget build(BuildContext context) {
    final webViewCubit = context.read<WebViewCubit>();

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("Hello Jeel Pay"),
      SizedBox(
        height: 10,
      ),
      BlocBuilder<WebViewCubit, WebViewState>(
        builder: (context, state) {
          if (state is WebViewLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WebViewError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is WebViewLoaded) {
            return SizedBox(
              height: state.height,
              child: WebViewWidget(
                controller: webViewCubit.controller,
                gestureRecognizers: Set()..add(
                    Factory<VerticalDragGestureRecognizer>(() =>
                        VerticalDragGestureRecognizer()), // this fixed scroll freezing of web view
                  ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () {
          webViewCubit.controller.loadRequest(Uri.parse(Constants.webUrl));
        },
        child: const Text('Reload'),
      ),
    ]);
  }
}
