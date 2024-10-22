import 'package:lineup/lineup.dart';
import 'package:lineup/src/database/init/db_io.dart'
if (dart.library.js_interop) 'package:lineup/src/database/init/db_web.dart';

abstract class LineupDatabaseInitializer{
  factory LineupDatabaseInitializer(LineupDatabase db) => LineupDatabaseInitializerImpl(db);
  Future<bool> checkDatabaseExist();
  Future<bool> create();
  Future<bool> alter();
  Future<bool> export();
}