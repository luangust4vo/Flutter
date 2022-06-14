import 'package:app_gifs/entity/gif.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String sql = """
CREATE TABLE gif(
    id INTEGER PRIMARY KEY NOT NULL,
    url VARCHAR(500) NOT NULL,
    preview VARCHAR(500) NOT NULL
);
""";

class Banco {
  static Database? db;

  static verificarDb() async {
    //Se não existir banco, chamará a função de criação para fazer isso
    db ??= await initDb();
  }

  static initDb() async {
    String caminho = join(await getDatabasesPath(), "db_gifinder");

    return await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) {
        db.execute(sql);
      },
    );
  }

  static Future<void> salvar(Gif gif) async {
    await verificarDb();
    var sql = "INSERT INTO gif(url, preview) VALUES(?, ?)";

    await db?.rawInsert(sql, [gif.url, gif.previewUrl]);
  }

  static Future<List<Gif>> buscar() async {
    await verificarDb();

    List<Map<String, dynamic>> result = await db!.query('gif');

    var gifs = <Gif>[];

    for (var json in result) {
      gifs.add(Gif.fromDatabase(json));
    }

    return gifs;  
  }
}
