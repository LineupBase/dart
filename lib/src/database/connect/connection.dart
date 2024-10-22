import 'package:lineup/lineup.dart';
import 'package:lineup/src/core/encryption/encrypt_service.dart';
import 'package:lineup/src/database/init/db_stub.dart';

class LineupDatabaseConnection {

  Future<LineupDatabase> local({required String databaseName, int? version, required LineupEncryptService encrypt}) async {

    final db = LineupDatabase(databaseName, version: version ?? 1);
    db.encrypt = encrypt;

    LineupDatabaseInitializer init = LineupDatabaseInitializer(db);
    await init.create();

    LineupDatabase.databases ??= {};
    LineupDatabase.databases?[databaseName] = db;

    return db;
  }

  Future<LineupDatabase> remote({required String name, int version = 1}) {
    throw UnimplementedError();
  }
}
