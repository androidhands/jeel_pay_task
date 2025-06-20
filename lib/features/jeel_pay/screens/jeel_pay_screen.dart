import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeel_pay_task/features/jeel_pay/bsuiness_logic/web_view_cubit.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/first_page_compoenet.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/second_page_component.dart';

class JeelPayScreen extends StatelessWidget {
   JeelPayScreen({Key? key}) : super(key: key);
List<Widget> pages = [
    const FirstPageCompoenet(),
    const SecondPageComponent(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeel Pay'),
      ),
      body: BlocProvider(
          create: (context) => WebViewCubit()..loadWebView(),
          child: ListView(
            shrinkWrap: true,
            children: [
             ExpandablePageView(
              children: pages,
             )
            ],
          )),
    );
  }
}
   
