import 'package:flutter/material.dart';
import 'package:web_route/src/ui/pages/nested_first_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  static const String routeName = '/firstPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(NestedFirstPage.routeName);
          },
          child: const Text('Click for Nested Page'))),);
  }
}
