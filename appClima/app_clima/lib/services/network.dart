// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

//faz a requisição, apenas
class Network {
  //atributo que guarda a url da api acessada
  String url;

  //construtor da classe Network
  Network(this.url);

  Future<Map<dynamic, dynamic>?> makeRequest() async {
    var requisicao = await Dio().get(url);

    //se o status da requisição for igual a 200(sucesso)
    if (requisicao.statusCode == 200) {
      //... então será retornado os dados da requisição
      return requisicao.data;
    }
    //se o status não for igual a 200(sucesso)
    else {
      //... então será retornado o erro
      print(requisicao.statusCode);
    }
  }
}
