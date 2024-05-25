import 'package:flutter/material.dart';
import '../models/jenis_kopi.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<JenisKopi>> _coffeeListFuture;
  List<JenisKopi> _coffeeList = [];
  List<JenisKopi> _filteredCoffeeList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _coffeeListFuture = _apiService.fetchCoffeeList();
    _searchController.addListener(_filterCoffeeList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCoffeeList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCoffeeList = _coffeeList
          .where((coffee) => coffee.name?.toLowerCase().contains(query) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<JenisKopi>>(
        future: _coffeeListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            _coffeeList = snapshot.data!;
            _filteredCoffeeList = _searchController.text.isEmpty
                ? _coffeeList
                : _coffeeList
                .where((coffee) => coffee.name?.toLowerCase().contains(_searchController.text.toLowerCase()) ?? false)
                .toList();
            return ListView.builder(
              itemCount: _filteredCoffeeList.length,
              itemBuilder: (context, index) {
                final coffee = _filteredCoffeeList[index];
                return ListTile(
                  title: Text(coffee.name ?? ''),
                  subtitle: Text(coffee.region ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen(coffee: coffee)),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
