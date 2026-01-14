import "dart:convert";
import 'package:http/http.dart' as http;
import "../../../utils/response.dart";

class HttpGetHelper {
  Future<Response<Map<int, T>>> getMap<T>(
    String host,
    int port,
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.http('$host:$port', path, queryParameters);

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return Response.error(Exception('Inválido: ${response.statusCode}'));
      }

      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final items = <int, T>{};

      for (final entry in jsonMap.entries) {
        final id = int.parse(entry.key);
        final value = fromJson(entry.value as Map<String, dynamic>);
        items[id] = value;
      }

      return Response.success(items);
    } catch (e) {
      return Response.error(Exception(e.toString()));
    }
  }

    Future<Response<T>> get<T>(
    String host,
    int port,
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.http('$host:$port', path, queryParameters);

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return Response.error(Exception('Inválido: ${response.statusCode}'));
      }
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final item = fromJson(jsonMap);

      return Response.success(item);
    } catch (e) {
      return Response.error(Exception(e.toString()));
    }
  }
}