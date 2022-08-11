import 'package:flutter/material.dart';

class NestedSecondPage extends StatelessWidget {
  const NestedSecondPage({Key? key}) : super(key: key);

  static const String routeName = '/nestedFromTwo';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Nested From Two'),),);
  }
}
