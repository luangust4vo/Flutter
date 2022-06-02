// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

//import 'dart:io';
//import 'package:http_proxy/http_proxy.dart';
import 'package:flutter/material.dart';
import 'services/localizacao.dart';
import 'services/network.dart';

void main() async {
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
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void testarPosicao() async {
    var localizacao = Localizacao();
    await localizacao.getLocalizacao();

    print(localizacao.latitude);
    print(localizacao.longitude);

    var requisicao =
        await Network("https://viacep.com.br/ws/01001000/json/").makeRequest();
    print(requisicao);
  }

  @override
  Widget build(BuildContext context) {
    testarPosicao();
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}
