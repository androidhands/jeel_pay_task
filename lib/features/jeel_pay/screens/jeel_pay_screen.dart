import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeel_pay_task/features/jeel_pay/bsuiness_logic/web_view_cubit.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/first_page_compoenet.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/second_page_component.dart';

class JeelPayScreen extends StatelessWidget {
  JeelPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeel Pay'),
      ),
      body: BlocProvider(
          create: (context) => WebViewCubit()..loadWebView(),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: screenHeight - appBarHeight - statusBarHeight,
                child: PageView(
                  children: [FirstPageCompoenet(), SecondPageComponent()],
                ),
              ),
            ],
          )),
    );
  }
}
