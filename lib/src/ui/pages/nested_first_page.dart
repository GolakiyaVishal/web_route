import 'package:flutter/material.dart';

class NestedFirstPage extends StatelessWidget {
  const NestedFirstPage({Key? key}) : super(key: key);

  static const String routeName = '/nestedFromOne';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Nested From One'),),);
  }
}
