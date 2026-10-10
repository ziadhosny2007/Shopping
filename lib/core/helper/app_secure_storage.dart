import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppSecureStorage {
  final FlutterSecureStorage storage;
  AppSecureStorage(this.storage);
  Future<String> read(String key) async {
    String data = await storage.read(key: key) ?? "";
    return data;
  }

  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  Future<bool> containsKey(String key) async {
    bool isContain = await storage.containsKey(key: key);
    return isContain;
  }
}
