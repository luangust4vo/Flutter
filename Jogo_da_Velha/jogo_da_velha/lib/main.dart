import 'package:flutter/material.dart';
import 'package:jogo_da_velha/nucleo/constantes.dart';
import 'package:jogo_da_velha/nucleo/tema.dart';
import 'package:jogo_da_velha/telas/home.dart';
import 'package:jogo_da_velha/telas/telaDoJogo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITULO_DO_JOGO,
      theme: temaJogo,
      routes: {
        "/": (context) => const Home(),
        "Jogo":(context) => const TelaDoJogo(),
      },
    );
  }
}