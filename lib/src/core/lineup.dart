import 'package:encrypt/encrypt.dart';
import 'package:lineup/lineup.dart';
import 'package:lineup/src/core/encryption/encrypt_service.dart';
import '../database/connect/connection.dart';
import 'encryption/encrypt_sample.dart';

class Lineup {
  static final Lineup _lineup = Lineup._();

  Lineup._();

  factory Lineup() => _lineup;

  static final LineupDatabaseConnection _databaseConnection =
      LineupDatabaseConnection();

  static Future<LineupDatabase> initLocalDatabase(
    String databaseName, {
    int? version,
    LineupEncryptService? customEncryptService,
    String? encryptSecureKey,
    String? encryptExtraSecureKey,
  }) =>
      _databaseConnection.local(
        databaseName: databaseName,
        version: version,
        encrypt: customEncryptService ??
            EncryptServiceSample(
              encryptSecureKey ?? Key.fromSecureRandom(32).base64,
              encryptExtraSecureKey,
            ),
      );
}
