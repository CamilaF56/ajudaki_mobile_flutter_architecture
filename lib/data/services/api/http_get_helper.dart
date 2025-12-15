import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../utils/result.dart';

class HttpGetHelper {
  Future<Result<List<T>>> getList<T>(
    String host,
    int port,
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final url = Uri.http('$host:$port', path);

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        return Result.error(Exception('Inaválido: ${response.statusCode}'));
      }

      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final items = jsonList
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.ok(items);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
