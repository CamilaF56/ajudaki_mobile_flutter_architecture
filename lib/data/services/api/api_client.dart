import '../../../models/work_listing.dart';
import '../../../models/work_category.dart';
import '../../../models/work_type.dart';
import '../../../models/professional.dart';
import '../../../utils/response.dart';
import 'http_get_helper.dart';

class ApiClient {
  ApiClient({String? host, int? port})
    : _host = host ?? 'localhost',
      _port = port ?? 5299,
      _helper = HttpGetHelper();

  final String _host;
  final int _port;
  final HttpGetHelper _helper;

  Future<Response<Map<int, WorkListing>>> getWorkListings() {
    return _helper.getMap(_host, _port, '/api/worklistings', WorkListing.fromJson);
  }

  Future<Response<WorkListing>> getWorkListing(int id) {
    return _helper.get(_host, _port, '/api/worklistings/$id', WorkListing.fromJson);
  }

  Future<Response<Map<int, WorkListing>>> searchWorkListings(
    String? terms,
    int? workCategoryId)
  {
    final Map<String, String> queryParameters = {};

    if (terms != null) queryParameters['terms'] = terms;
    if (workCategoryId != null) queryParameters['workCategoryId'] = workCategoryId.toString();

    return _helper.getMap(
      _host,
      _port,
      '/api/worklistings/search',
      WorkListing.fromJson,
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );
  }

  Future<Response<Map<int, WorkCategory>>> getWorkCategories() {
    return _helper.getMap(_host, _port, '/api/workcategories', WorkCategory.fromJson);
  }

  Future<Response<WorkCategory>> getWorkCategory(int id) {
    return _helper.get(_host, _port, '/api/workcategories/$id', WorkCategory.fromJson);
  }

  Future<Response<Map<int, WorkType>>> getWorkTypes() {
    return _helper.getMap(_host, _port, '/api/worktypes', WorkType.fromJson);
  }

  Future<Response<WorkType>> getWorkType(int id) {
    return _helper.get(_host, _port, '/api/worktypes/$id', WorkType.fromJson);
  }

  Future<Response<Map<int, Professional>>> getProfessionals() {
    return _helper.getMap(_host, _port, '/api/professionals', Professional.fromJson);
  }

  Future<Response<Professional>> getProfessional(int id) {
    return _helper.get(_host, _port, '/api/professionals/$id', Professional.fromJson);
  }
}