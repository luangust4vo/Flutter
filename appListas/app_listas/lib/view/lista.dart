// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listas"),
          actions: [
            IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () => null,
            )
          ],
        ),
        body: Column(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed("cadastrar"),
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
