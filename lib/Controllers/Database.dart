import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseController extends GetxController {
  late final database;
  final databasePath = getDatabasesPath().toString();

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  initDatabase() async => await openDatabase(
        path.join(databasePath, 'woo_test.db'),
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
          CREATE TABLE favorites (id INTEGER PRIMARY KEY, name TEXT, price TEXT, image TEXT, description TEXT)
          ''');
          await db.execute('''
          CREATE TABLE cart (id INTEGER PRIMARY KEY, name TEXT, price TEXT, image TEXT, description TEXT)          
          ''');
          await db.execute(
            '''
            CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, price TEXT, image TEXT, description TEXT)
            '''
          );
        },
      );
}
