import 'package:flutter/material.dart';

void main() {
  runApp(BlocPaketi());
}

class BlocPaketi extends StatefulWidget {
  @override
  _BlocPaketiState createState() => _BlocPaketiState();
}

class _BlocPaketiState extends State<BlocPaketi> {
  int _sayac = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Bloc Paketi",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(heroTag: 1, onPressed: () {
              setState(() {
                _sayac++;
              });
            }),
            FloatingActionButton(heroTag: 2, onPressed: () {}),
          ],
        ),
        appBar: AppBar(
          title: Text("Flutter Blog Paketi"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("buraya yazı geliyor"),
                Text("$_sayac"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
