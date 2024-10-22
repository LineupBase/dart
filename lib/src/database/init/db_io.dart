import 'dart:convert';
import 'dart:io';
import 'package:lineup/lineup.dart';
import 'package:path/path.dart' as path;
import 'package:lineup/src/database/init/db_stub.dart';
import 'package:path_provider/path_provider.dart';

class LineupDatabaseInitializerImpl implements LineupDatabaseInitializer {
  final LineupDatabase db;

  const LineupDatabaseInitializerImpl(this.db);

  static const String _baseDatabaseFileName = '.lineup_databases.lineup';

  @override
  Future<bool> alter() {
    // TODO: implement alter
    throw UnimplementedError();
  }

  @override
  Future<bool> checkDatabaseExist() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final databaseDir = Directory(
      path.join(appDocumentsDir.path, _baseDatabaseFileName, db.name),
    );

    return databaseDir.existsSync();
  }

  @override
  Future<bool> create() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

    final databaseDir = Directory(
      path.join(appDocumentsDir.path, _baseDatabaseFileName, db.name),
    );

    if(!databaseDir.existsSync()){
      databaseDir.createSync(recursive: true);
    }

    final base = File(path.join(databaseDir.path, '.base.txt'));

    if (base.existsSync()) {
      final data = base.readAsStringSync();
      print('--------------------------------------\nREAD SUCCESSFULLY');
      print('data $data');

      final decryptData = db.encrypt.decrypt(data);
      print('decryptData $decryptData');

      return true;
    }

    await base.create(recursive: true);
    base.writeAsString(
      db.encrypt.encrypt(
        jsonEncode({
          'name': db.name,
          'version': db.version,
        }),
      ),
    );

    return true;
  }

  @override
  Future<bool> export() {
    // TODO: implement export
    throw UnimplementedError();
  }
}
