// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

//import 'dart:io';
//import 'package:http_proxy/http_proxy.dart';
import 'package:app_clima/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  //Comandos para conexão do proxy(ou algo assim)
  /* WidgetsFlutterBinding.ensureInitialized();
  HttpProxy httpProxy = await HttpProxy.createHttpProxy();
  httpProxy.host = "http://aluno:aluno@172.30.1.1";
  httpProxy.port = "3128";
  HttpOverrides.global = httpProxy; */
  runApp(Clima());
}

class Clima extends StatelessWidget {
  const Clima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: Home());
  }
}
