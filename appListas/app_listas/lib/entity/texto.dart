class Texto {
  int? id;
  String conteudo;

  Texto({this.id, required this.conteudo});

  static Texto fromDataBase(Map<String, dynamic> json) {
    return Texto(id: json['id'], conteudo: json['conteudo']);
  }
}
