import 'dart:convert';
import 'api_client_web_mobile.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiClientPath<T> {
  ApiClientPath({
    required this.resource,
    required this.fromJson,
  });

  final String resource;
  final FromJson<T> fromJson;

  Future<Map<int, T>?> getAll() async {
    final result = await ApiClientWebMobile.get('/api/$resource');
    final statusCode = result['statusCode'] as int;
    final stringData = result['body'] as String?;

    if (statusCode != 200) return null;

    final Map<String, dynamic> jsonMap =
        jsonDecode(stringData!) as Map<String, dynamic>;

    return jsonMap.map(
      (key, value) => MapEntry(
        int.parse(key),
        fromJson(value as Map<String, dynamic>),
      ),
    );
  }

  Future<T?> get(int id) async {
    final result = await ApiClientWebMobile.get('/api/$resource/$id');
    final statusCode = result['statusCode'] as int;
    final stringData = result['body'] as String?;

    if (statusCode != 200) return null;

    return fromJson(jsonDecode(stringData!));
  }
}