import 'package:dio/dio.dart';

//classe responsável por, unica e exclusivamente, fazer a requesição das API's
class Network {
  String url;

  Network(this.url);

  Future<Map<dynamic, dynamic>?> makeRequest() async {
    var requisicao = await Dio().get(url);

    if (requisicao.statusCode == 200) {
      return requisicao.data;
    } else {
      // ignore: avoid_print
      print(requisicao.statusCode);
    }
  }
}
