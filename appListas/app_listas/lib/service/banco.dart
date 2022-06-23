import 'package:app_listas/entity/texto.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as path;

const String sql = """
CREATE TABLE item_lista(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    conteudo VARCHAR(200) NOT NULL,
);
""";

class Banco {
  static Database? db;

  static checarDb() async {
    db ??= await initDb();
  }

  static initDb() async {
    String caminho = path.join(await getDatabasesPath(), "db_flash_chat");
    return await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) {
        db.execute(sql);
      },
    );
  }

  static Future<int?> salvar(Texto item) async {
    await checarDb();
    var sql = "INSERT INTO item_lista(conteudo) VALUES(?)";
    int? id = await db?.rawInsert(sql, [item.conteudo]);

    return id;
  }

  static Future<List<Texto>> buscar() async {
    await checarDb();

    List<Map<String, dynamic>> resultado = await db!.query('item_lista');

    var itens = <Texto>[];

    for (var json in resultado) {
      itens.add(Texto.fromDataBase(json));
    }

    return itens;
  }

  static Future<void> remover(int id) async {
    var sql = "DELETE FROM item_lista WHERE id = ?";
    await db!.rawDelete(sql, [id]);
  }
}