import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:lineup/src/core/encryption/encrypt_service.dart';

class EncryptServiceSample implements LineupEncryptService {
  final Encrypter _encrypter;

  EncryptServiceSample(String encryptKey, String? extraSecure)
      : _encrypter = Encrypter(AES(
          Key.fromBase64(encryptKey),
          mode: AESMode.gcm,
        )),
        _macValue = Uint8List.fromList(utf8.encode(
          extraSecure ?? 'Lineup: Secure, scalable, fast, encrypted database',
        ));

  final String _separationKeyName = ':lineup:';
  final Uint8List _macValue;

  @override
  String? decrypt(String storedData) {
    // Split stored data into IV and encrypted parts
    final (ivBase64, encryptedData) = _separateEncrypted(storedData);
    if (ivBase64 == null || encryptedData == null) {
      return null;
    }

    // Decode IV and encrypted data
    final iv = IV(base64.decode(ivBase64));
    final encrypted = Encrypted.fromBase64(encryptedData);

    // Decrypt the data
    return _encrypter.decrypt(
      encrypted,
      iv: iv,
      associatedData: _macValue,
    );
  }

  @override
  String encrypt(String plainText) {
    // Generate a random IV
    final iv = IV.fromSecureRandom(16);

    final encrypted = _encrypter.encrypt(
      plainText,
      iv: iv,
      associatedData: _macValue,
    );

    // Combine IV and encrypted data for storage
    final ivBase64 = base64.encode(iv.bytes); // Convert IV to Base64
    final encryptedData = encrypted.base64;

    return '$encryptedData$_separationKeyName$ivBase64';
  }

  (String?, String?) _separateEncrypted(String encrypted) {
    final parts = encrypted.split(_separationKeyName);
    return (parts.lastOrNull, parts.firstOrNull);
  }
}

void main() {
  print(Key.fromSecureRandom(32).base64);
}
