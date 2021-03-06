// ignore_for_file: avoid_print

import 'package:app_clima/services/api.dart';
import 'package:app_clima/services/localizacao.dart';
import 'package:app_clima/services/network.dart';

class Tempo {
  static Future<dynamic> getTempo() async {
    var localizacao = Localizacao();

    await localizacao.getLocalizacao();
    print(
        "${API.apiUrl}appid=${API.key}&lat=${localizacao.latitude}&lon=${localizacao.longitude}&units=metric");
    var requisicao = await Network(
            "${API.apiUrl}appid=${API.key}&lat=${localizacao.latitude}&lon=${localizacao.longitude}&units=metric")
        .makeRequest();

    return API.fromJson(requisicao);
  }

  static getEmoji(int condicao){
    if (condicao < 300) {
      return '๐ฉ';
    } else if (condicao < 400) {
      return '๐ง';
    } else if (condicao < 600) {
      return 'โ๏ธ';
    } else if (condicao < 700) {
      return 'โ๏ธ';
    } else if (condicao < 800) {
      return '๐ซ';
    } else if (condicao == 800) {
      return 'โ๏ธ';
    } else if (condicao <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static getDescricao(int temp){
    if (temp > 28) {
      return 'ร hora do ๐ฆ';
    } else if (temp > 22) {
      return 'Hora de shorts e ๐';
    } else if (temp < 15) {
      return 'Pegue seu ๐งฃ e ๐งค';
    } else {
      return 'Leve um ๐งฅ para garantir';
    }
  }
}
