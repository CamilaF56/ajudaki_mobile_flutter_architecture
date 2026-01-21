import '../../domain/work_category.dart';
import '../../utils/result.dart';
import '../services/api/api_client.dart';

/// Repositório responsável por obter as categorias de trabalho.
class WorkCategoryRepository {
  /// Cria o repositório com o cliente de API utilizado nas requisições.
  WorkCategoryRepository(this._apiClient);

  final ApiClient _apiClient;

  List<WorkCategory>? _cache;

  /// Retorna todas as categorias de trabalho.
  ///
  /// Caso exista cache, os dados são retornados diretamente.
  /// Caso contrário, a lista é buscada na API.
  Future<Result<List<WorkCategory>>> getAll() async {
    if (_cache == null) {
      final result = await _apiClient.getWorkCategories();

      if (result is Ok<Map<int, WorkCategory>>) {
        _cache = result.value.values.toList();
      }
    }

    return Result.success(_cache!);
  }
}
