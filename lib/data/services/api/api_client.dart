import '../../../domain/work_category.dart';
import '../../../domain/work_listing.dart';
import '../../../utils/result.dart';
import 'http_get_helper.dart';

/// Cliente responsável pela comunicação HTTP com a API backend.
class ApiClient {
  /// Cria uma instância do cliente de API.
  ApiClient();

  /// Endereço do servidor da API.
  final String _host = 'localhost';

  /// Porta utilizada para acesso à API.
  final int _port = 5299;

  /// Helper responsável por realizar requisições HTTP GET.
  final HttpGetHelper _helper = HttpGetHelper();

  /// Retorna todos os anúncios de trabalho.
  Future<Result<Map<int, WorkListing>>> getWorkListings() =>
      _helper.getMap(_host, _port, '/api/worklistings', WorkListing.fromJson);

  /// Realiza a busca de anúncios de trabalho por termo e/ou categoria.
  ///
  /// Ambos os parâmetros são opcionais e utilizados conforme informados.
  Future<Result<Map<int, WorkListing>>> searchWorkListings(
    final String? terms,
    final int? workCategoryId,
  ) {
    final queryParameters = <String, String?>{};

    queryParameters['terms'] = terms;
    queryParameters['workCategoryId'] = workCategoryId.toString();

    return _helper.getMap(
      _host,
      _port,
      '/api/worklistings/search',
      WorkListing.fromJson,
      queryParameters: queryParameters,
    );
  }

  /// Retorna todas as categorias de trabalho.
  Future<Result<Map<int, WorkCategory>>> getWorkCategories() => _helper.getMap(
    _host,
    _port,
    '/api/workcategories',
    WorkCategory.fromJson,
  );
}
