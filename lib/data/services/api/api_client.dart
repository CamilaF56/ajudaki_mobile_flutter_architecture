import '../../../models/professional.dart';
import '../../../models/work_category.dart';
import '../../../models/work_listing.dart';
import '../../../models/work_type.dart';
import '../../../utils/response.dart';
import 'http_get_helper.dart';

class ApiClient {
  ApiClient();
  
  final String _host = 'localhost';
  final int _port = 5299;
  final HttpGetHelper _helper = HttpGetHelper();

  Future<Response<Map<int, WorkListing>>> getWorkListings() =>
    _helper.getMap(_host, _port, '/api/worklistings', WorkListing.fromJson);

  Future<Response<WorkListing>> getWorkListing(final int id) =>
    _helper.get(_host, _port, '/api/worklistings/$id', WorkListing.fromJson);

  Future<Response<Map<int, WorkListing>>> searchWorkListings(
    final String? terms,
    final int? workCategoryId)
  {
    final queryParameters = <String, String>{};

    if (terms != null) {
      queryParameters['terms'] = terms;
    }

    if (workCategoryId != null) {
      queryParameters['workCategoryId'] = workCategoryId.toString();
    }

    return _helper.getMap(
      _host,
      _port,
      '/api/worklistings/search',
      WorkListing.fromJson,
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );
  }

  Future<Response<Map<int, WorkCategory>>> getWorkCategories() =>
    _helper.getMap(_host, _port, '/api/workcategories', WorkCategory.fromJson);

  Future<Response<WorkCategory>> getWorkCategory(final int id) =>
    _helper.get(_host, _port, '/api/workcategories/$id', WorkCategory.fromJson);

  Future<Response<Map<int, WorkType>>> getWorkTypes() =>
    _helper.getMap(_host, _port, '/api/worktypes', WorkType.fromJson);

  Future<Response<WorkType>> getWorkType(final int id) =>
    _helper.get(_host, _port, '/api/worktypes/$id', WorkType.fromJson);

  Future<Response<Map<int, Professional>>> getProfessionals() =>
    _helper.getMap(_host, _port, '/api/professionals', Professional.fromJson);

  Future<Response<Professional>> getProfessional(final int id) =>
    _helper.get(_host, _port, '/api/professionals/$id', Professional.fromJson);
}