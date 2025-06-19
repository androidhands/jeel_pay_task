import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeel_pay_task/features/jeel_pay/bsuiness_logic/web_view_cubit.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/first_page_compoenet.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/second_page_component.dart';

class JeelPayScreen extends StatelessWidget {
  const JeelPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeel Pay'),
      ),
      body: BlocProvider(
        create: (context) => WebViewCubit()..loadWebView(),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                children: [FirstPageCompoenet(), SecondPageComponent()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
