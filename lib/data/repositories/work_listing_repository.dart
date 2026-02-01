import '../../domain/work_listing.dart';
import '../../utils/result.dart';
import '../services/api/api_client.dart';

/// Repositório responsável por obter os anúncios de trabalho.
class WorkListingRepository {
  /// Cria o repositório com o cliente de API utilizado nas requisições.
  WorkListingRepository(this._apiClient);

  final ApiClient _apiClient;

  List<WorkListing>? _cache;

  /// Retorna todos os anúncios de trabalho.
  ///
  /// Caso exista cache, os dados são retornados diretamente.
  /// Caso contrário, a lista é buscada na API.
  Future<Result<List<WorkListing>>> getAll() async {
    if (_cache == null) {
      final result = await _apiClient.getWorkListings();

      if (result is Ok<Map<int, WorkListing>>) {
        _cache = result.value.values.toList();
      }
    }
    
    return Result.success(_cache!);
  }

  /// Retorna os anúncios filtrados por categoria.
  ///
  /// Caso exista cache, o filtro é aplicado localmente.
  /// Caso contrário, a busca é realizada via API.
  Future<Result<List<WorkListing>>> getByCategory(
    final int categoryId,
  ) async {
    if (_cache == null) {
      final result = await _apiClient.searchWorkListings(null, categoryId);

      if (result is Ok<Map<int, WorkListing>>) {
        return Result.success(result.value.values.toList());
      }
    }

    final filtered = _cache!
    .where(
      (final workListing) =>
        workListing.workType?.workCategory?.id == categoryId,
    ).toList();

    return Result.success(filtered);
  }

  /// Retorna os anúncios filtrados pelo termo de busca.
  ///
  /// A busca é realizada via API.
  Future<Result<List<WorkListing>>> getByTerm(final String terms) async {
    final result = await _apiClient.searchWorkListings(terms, null);

    List<WorkListing>? list;
    if (result is Ok<Map<int, WorkListing>>) {
      list = result.value.values.toList();
    }

    return Result.success(list!);
  }
}
