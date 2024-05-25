import 'package:hive/hive.dart';

class AuthService {
  final Box userBox = Hive.box('userBox');

  Future<void> register(String username, String password) async {
    userBox.put('username', username);
    userBox.put('password', password);
  }

  bool login(String username, String password) {
    String? storedUsername = userBox.get('username');
    String? storedPassword = userBox.get('password');

    if (storedUsername == username && storedPassword == password) {
      return true;
    }
    return false;
  }
}
