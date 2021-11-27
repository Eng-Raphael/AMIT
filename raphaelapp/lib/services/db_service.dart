import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {
  static Future<sql.Database> databse() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart(id TEXT PRIMARY KEY, count Text, price Text)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(Map<String, Object> data) async {
    final db = await databse();
    db.insert(
      'cart',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await databse();
    return db.query('cart');
  }

  static Future<void> delete(String id) async {
    final db = await databse();
    db.delete('cart', where: 'id = $id');
  }

  static Future<void> deleteall() async {
    final db = await databse();
    db.delete('cart');
  }
}
