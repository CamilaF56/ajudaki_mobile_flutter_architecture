import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../utils/response.dart';

class HttpGetHelper {
  Future<Response<List<T>>> getList<T>(
    String host,
    int port,
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final url = Uri.http('$host:$port', path);

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        return Response.error(Exception('Inaválido: ${response.statusCode}'));
      }

      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final items = jsonList
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();

      return Response.success(items);
    } catch (e) {
      return Response.error(Exception(e.toString()));
    }
  }
}
