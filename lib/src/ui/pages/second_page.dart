import 'package:flutter/material.dart';
import 'package:web_route/src/ui/pages/nested_second_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const String routeName = '/secondPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(NestedSecondPage.routeName);
            },
            child: Text('Click for nested Page')),
      ),
    );
  }
}
