import 'dart:convert';
import 'package:http/http.dart' as http;

class FlincapApiClient {
  final String baseUrl;
  final String bearerToken;

  FlincapApiClient({required this.baseUrl, required this.bearerToken});

  Future<Map<String, dynamic>> _makeGetRequest(String path) async {
    final response = await http.get(
      Uri.parse('$baseUrl$path'),
      headers: {'Authorization': 'Bearer $bearerToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> _makePostRequest(String path, dynamic body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }


  Future<Map<String, dynamic>> getRate(String selectedCrypt, String selectedFiat) async {
    final path = '/v1/get-rate?selectedCrypt=$selectedCrypt&selectedFiat=$selectedFiat';
    return _makeGetRequest(path);
  }

  Future<Map<String, dynamic>> getExchange() async {
    final path = '/v1/get-exchange';
    return _makeGetRequest(path);
  }

  Future<Map<String, dynamic>> createTransaction(Map<String, dynamic> transactionData) async {
    final path = '/v1/create-transaction';
    return _makePostRequest(path, transactionData);
  }

  Future<Map<String, dynamic>> getTransaction(String transactionId) async {
    final path = '/v1/get-transactions/$transactionId';
    return _makeGetRequest(path);
  }

  Future<Map<String, dynamic>> getHistory(String transactionType, String selectedFiat) async {
    final path = '/api/v1/get-transactions?transactionType=$transactionType&selectedFiat=$selectedFiat';
    return _makeGetRequest(path);
  }
}
