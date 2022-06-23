// ignore_for_file: prefer_const_constructors

import 'package:app_listas/view/cadastrar.dart';
import 'package:app_listas/view/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Listas());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Listas(),
    );
  }
}

class Listas extends StatelessWidget {
  const Listas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "App de Listas", routes: {
      "/": (context) => Home(),
      "cadastrar": (context) => Cadastrar()
    });
  }
}
