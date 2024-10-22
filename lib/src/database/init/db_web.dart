
import 'package:idb_shim/idb_browser.dart';
import '../lineup_database.dart';
import 'db_stub.dart';

class LineupDatabaseInitializerImpl implements LineupDatabaseInitializer {

  final LineupDatabase db;

  const LineupDatabaseInitializerImpl(this.db);

  @override
  Future<bool> alter() {
    // TODO: implement alter
    throw UnimplementedError();
  }

  @override
  Future<bool> checkDatabaseExist() {
    // TODO: implement checkDatabaseExist
    throw UnimplementedError();
  }

  @override
  Future<bool> create() async {
    // Open or create a database
    var dbFactory = idbFactoryBrowser;
    Database indexedDB = await dbFactory.open(db.name, version: db.version,
        onUpgradeNeeded: (VersionChangeEvent event) {
          var db = event.database;
          // Create an object store if not exists
          if (!db.objectStoreNames.contains('myObjectStore')) {
            db.createObjectStore('myObjectStore', keyPath: 'id');
          }
        });

    return true;
    // // Add data
    // await addData(db);
    // // Retrieve data
    // await getData(db);
  }

  @override
  Future<bool> export() {
    // TODO: implement export
    throw UnimplementedError();
  }

}