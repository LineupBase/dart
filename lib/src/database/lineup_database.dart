
import 'package:lineup/src/core/encryption/encrypt_service.dart';

class LineupDatabase {

  static Map<String, LineupDatabase>? databases;

  String name;
  int version;

  LineupDatabase(
    this.name, {
    this.version = 1,
  });

  late LineupEncryptService encrypt;

  Future<bool> initializeDatabase() async{
    return false;
  }
}
