abstract interface class LineupEncryptService{
  String encrypt(String data);
  String? decrypt(String encrypted);
}