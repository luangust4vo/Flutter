import 'package:app_gifs/services/network.dart';

//variáveis que guardam o link e a chave da API utilizada
const String apiUrl = "https://g.tenor.com/v1";
const String apiKey = "LIVDSRZULELA";

//classe responsável por retornar uma lista de gifs dados pela API
class Gif {
  int? id;
  String url;
  String previewUrl;

  Gif({this.id, required this.url, required this.previewUrl});

  static Gif fromJson(Map<String, dynamic> json) {
    return Gif(
        url: json["media"][0]["gif"]["url"],
        previewUrl: json["media"][0]["nanogif"]["url"]);
  }

  static Gif fromDatabase(Map<String, dynamic> json) {
    return Gif(id: json["id"], url: json["url"], previewUrl: json["preview"]);
  }

  static Future<List<Gif>> getGifs({int pagina = 0, String busca = ""}) async {
    var gifs = <Gif>[];

    var url = "$apiUrl/search?q=$busca&key=$apiKey&limit=12";

    if (busca != "") {
      url += "&pos=${pagina * 12}";
    }

    var json = await Network(url).makeRequest();

    if (json?["results"] != null) {
      var dados = json?["results"] as List<dynamic>;

      for (var valor in dados) {
        gifs.add(fromJson(valor));
      }
    }

    return gifs;
  }
}
