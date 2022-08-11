
import 'package:flutter/material.dart';
import 'package:web_route/src/ui/pages/first_page.dart';
import 'package:web_route/src/ui/pages/nested_first_page.dart';
import 'package:web_route/src/ui/pages/nested_second_page.dart';
import 'package:web_route/src/ui/pages/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  static const String routeName = '/';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),

      body: Row(
        children: [
          SizedBox(
            width: 240,
            child: Column(
              children: [
                DrawerTile(label: 'Route 1', onTap: (){
                  Navigator.of(context).pushNamed(FirstPage.routeName);
                }),
                DrawerTile(label: 'Route 2', onTap: (){
                  Navigator.of(context).pushNamed(SecondPage.routeName);
                })
              ],
            ),
          ),
          Expanded(child:  Navigator(
            initialRoute: FirstPage.routeName,
            onGenerateRoute: (settings){
              if(settings.name == FirstPage.routeName){
                return MaterialPageRoute(builder: (context) => const FirstPage());
              } else if(settings.name == SecondPage.routeName){
                return MaterialPageRoute(builder: (context) => const SecondPage());
              } else if(settings.name == NestedFirstPage.routeName) {
                return MaterialPageRoute(builder:(context) => const NestedFirstPage());
              } else if(settings.name == NestedSecondPage.routeName){
                return MaterialPageRoute(builder:(context) => const NestedSecondPage());
              } else {
                return null;
              }
            },
          ))
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key, required this.onTap, required this.label}) : super(key: key);

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(label),
      ),
    );
  }
}
