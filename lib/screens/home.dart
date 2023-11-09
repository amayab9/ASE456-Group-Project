import 'package:ase456_group_project/screens/scientific_calculator.dart';
import 'package:flutter/material.dart';
import 'package:ase456_group_project/screens/simple.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int tab = 0;

  void selectItem(int itemIndex) {
    setState(() {
      tab = itemIndex;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: [Simple(), ScientificCalculator() ][tab],
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text("Item 1"),
              onTap: () {
                selectItem(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text("Scientific Calculator"),
              onTap: () {
                selectItem(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 80,
                width: 260,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: const Text(
                  "Item1",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ]),
    ));
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 80,
                width: 260,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: const Text(
                  "Item2",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ]),
    ));
  }
}
