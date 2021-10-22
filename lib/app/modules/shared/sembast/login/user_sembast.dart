import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:sembast/sembast.dart';
import 'package:sweet_pet_mobile/app/modules/shared/models/user/user_model.dart';

import '../sambest.dart';

class UserSembast {
  static const String folderNameLogin = "User";
  final _nameFolder = stringMapStoreFactory.store(folderNameLogin);

  AppDatabase _appDatabase = Modular.get();

  Future<Database> get _db async => await _appDatabase.database;

  Future insert(UserModel user) async {
    Database db = await _db;
    db.transaction((transaction) async {
      await _nameFolder
          .record(user.id.toString())
          .put(transaction, json.decode(jsonEncode(user)));
    });
  }

  Future delete(UserModel user) async {
    Database db = await _db;
    db.transaction((transaction) async {
      await _nameFolder.record(user.id.toString()).delete(transaction);
    });
  }

  Future<UserModel?> get(UserModel user) async {
    final recordSnapshot =
        await _nameFolder.record(user.id.toString()).get(await _db);
    if (recordSnapshot != null) {
      final faz = UserModel.fromJson(recordSnapshot);

      return faz;
    } else {
      return null;
    }
  }

  Future<UserModel?> getFilter({filter, dataSearch}) async {
    var finder =
        Finder(filter: Filter.equals(filter, dataSearch, anyInList: false));
    final recordSnapshot =
        await _nameFolder.findFirst(await _db, finder: finder);
    if (recordSnapshot != null) {
      return UserModel.fromJson(json.decode(json.encode(recordSnapshot.value)));
    } else {
      return null;
    }
  }

  Future<List<UserModel>> getAllLogin() async {
    final recordSnapshot = await _nameFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final user = UserModel.fromJson(snapshot.value);
      return user;
    }).toList();
  }
}
