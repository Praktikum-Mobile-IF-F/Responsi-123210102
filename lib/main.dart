import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/jenis_kopi.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JenisKopiAdapter());
  await Hive.openBox<JenisKopi>('favorites');
  await Hive.openBox('userBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffe App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginScreen(),
    );
  }
}
