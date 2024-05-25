import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/jenis_kopi.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final Box<JenisKopi> favoriteBox = Hive.box<JenisKopi>('favorites');

  @override
  Widget build(BuildContext context) {
    final favorites = favoriteBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final coffee = favorites[index];
          return ListTile(
            title: Text(coffee.name ?? ''),
            subtitle: Text(coffee.region ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(coffee: coffee)),
              ).then((value) => setState(() {}));
            },
          );
        },
      ),
    );
  }
}
