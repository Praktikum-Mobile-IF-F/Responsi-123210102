import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/jenis_kopi.dart';

class ApiService {
  final String apiUrl = 'https://fake-coffee-api.vercel.app/api';

  Future<List<JenisKopi>> fetchCoffeeList() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => JenisKopi.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load coffee list');
    }
  }
}
