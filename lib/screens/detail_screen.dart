import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/jenis_kopi.dart';

class DetailScreen extends StatefulWidget {
  final JenisKopi coffee;

  DetailScreen({required this.coffee});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Box<JenisKopi> favoriteBox;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    favoriteBox = Hive.box<JenisKopi>('favorites');
    isFavorite = favoriteBox.containsKey(widget.coffee.id);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoriteBox.delete(widget.coffee.id);
      } else {
        favoriteBox.put(widget.coffee.id, widget.coffee);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.coffee.imageUrl ?? ''),
            SizedBox(height: 20),
            Text(
              widget.coffee.name ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(widget.coffee.description ?? ''),
            SizedBox(height: 10),
            Text('Region: ${widget.coffee.region ?? ''}'),
            Text('Price: \$${widget.coffee.price?.toStringAsFixed(2) ?? ''}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Text(isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
