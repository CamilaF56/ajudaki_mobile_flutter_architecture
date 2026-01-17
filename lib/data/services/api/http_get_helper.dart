import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../utils/result.dart';

/// Helper responsável por realizar requisições HTTP GET.
///
/// Centraliza a lógica de comunicação com a API e o tratamento
/// das respostas no formato [Result].
class HttpGetHelper {
  /// Executa uma requisição GET que retorna um mapa de objetos.
  ///
  /// O JSON esperado deve estar no formato:
  /// `{ "id": { ...objeto... } }`
  ///
  /// O parâmetro [fromJson] é responsável por converter o JSON
  /// para o tipo [T].
  Future<Result<Map<int, T>>> getMap<T>(
    final String host,
    final int port,
    final String path,
    final T Function(Map<String, dynamic>) fromJson, {
    final Map<String, String?>? queryParameters,
  }) async {
    final uri = Uri.http('$host:$port', path, queryParameters);

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return Result.error(Exception('Inválido: ${response.statusCode}'));
      }

      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final items = <int, T>{};

      for (final entry in jsonMap.entries) {
        final id = int.parse(entry.key);
        final value = fromJson(entry.value as Map<String, dynamic>);
        items[id] = value;
      }

      return Result.success(items);
    } on Exception catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  /// Executa uma requisição GET que retorna um único objeto.
  ///
  /// O parâmetro [fromJson] converte o JSON retornado
  /// para o tipo [T].
  Future<Result<T>> get<T>(
    final String host,
    final int port,
    final String path,
    final T Function(Map<String, dynamic>) fromJson, {
    final Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.http('$host:$port', path, queryParameters);

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return Result.error(Exception('Inválido: ${response.statusCode}'));
      }

      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final item = fromJson(jsonMap);

      return Result.success(item);
    } on Exception catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
