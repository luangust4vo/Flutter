class Texto {
  int id;
  String conteudo;

  Texto(this.id, this.conteudo);

  static Texto fromDataBase(Map<String, dynamic> json) {
    return Texto(json['id'], json['conteudo']);
  }
}
