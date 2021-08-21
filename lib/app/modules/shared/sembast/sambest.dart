import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase();

  static AppDatabase get instance => _singleton;

  Future<Database> get database async {
    return _openDatabase();
  }

  Future<Database> _openDatabase() async {
    final db;

    // Obtenha um diretório específico da plataforma onde os dados persistentes do aplicativo podem ser armazenados
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder =
        Directory('${appDocumentDir.path}/SweetPet/1/Data/');

    if (await _appDocDirFolder.exists()) {
      // Caminho com o formato: /platform-specific-directory/demo.db
      final dbPath = join(_appDocDirFolder.path, 'SweetPet.db');

      db = await databaseFactoryIo.openDatabase(dbPath);
    } else {
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      final dbPath = join(_appDocDirNewFolder.path, 'SweetPet.db');

      db = await databaseFactoryIo.openDatabase(dbPath);
    }

    return db;
  }
}
