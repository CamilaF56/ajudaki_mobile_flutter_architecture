import '../../../models/work_listing.dart';
import '../../../models/work_category.dart';
import '../../../utils/response.dart';
import 'http_get_helper.dart';

class ApiClient {
  ApiClient({String? host, int? port})
    : _host = host ?? 'localhost',
      _port = port ?? 5217,
      _helper = HttpGetHelper();

  final String _host;
  final int _port;
  final HttpGetHelper _helper;

  Future<Response<List<WorkListing>>> getWorkListings() {
    return _helper.getList(_host, _port, '/api/servico', WorkListing.fromJson);
  }

  Future<Response<List<WorkListing>>> searchWorkListings(String termo) {
    final encodedTerm = Uri.encodeQueryComponent(termo);
    return _helper.getList(
      _host,
      _port,
      '/api/servico/buscar?termo=$encodedTerm',
      WorkListing.fromJson,
    );
  }

  Future<Response<List<WorkListing>>> getWorkListingsByCategory(int areaId) {
    return _helper.getList(
      _host,
      _port,
      '/api/servico/area/$areaId',
      WorkListing.fromJson,
    );
  }

  Future<Response<List<WorkCategory>>> getWorkCategory() {
    return _helper.getList(
      _host,
      _port,
      '/api/areaAtuacao',
      WorkCategory.fromJson,
    );
  }
}
