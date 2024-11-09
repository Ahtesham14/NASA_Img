import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApiClient {
  static const String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String apiKey;

  NasaApiClient() : apiKey = dotenv.env['NASA_API_KEY'] ?? '';

  Future<Map<String, dynamic>> fetchApod() async {
    final url = Uri.parse('$_baseUrl?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Astronomy Picture of the Day');
    }
  }
}
