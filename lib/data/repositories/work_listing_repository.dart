import '../../models/work_listing.dart';
import '../../utils/response.dart';
import '../services/api/api_client.dart';

class WorkListingRepository {
  WorkListingRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  List<WorkListing>? _cachedWorkListings;

  final Map<int, List<WorkListing>> _cachedWorkListingsByArea = {};

  Future<Response<List<WorkListing>>> getAll() async {
    if (_cachedWorkListings != null) {
      return Future.value(Response.success(_cachedWorkListings!));
    }

    final result = await _apiClient.getWorkListings();

    if (result is Success<List<WorkListing>>) {
      _cachedWorkListings = result.value;
      return Response.success(result.value);
    } else if (result is Error<List<WorkListing>>) {
      return Response.error(result.error);
    } else {
      return Response.error(Exception('Resultado inesperado'));
    }
  }

  Future<Response<List<WorkListing>>> getByAreaAtuacao(int areaId) async {
    if (_cachedWorkListingsByArea.containsKey(areaId)) {
      return Future.value(Response.success(_cachedWorkListingsByArea[areaId]!));
    }

    final result = await _apiClient.getWorkListingsByCategory(areaId);

    if (result is Success<List<WorkListing>>) {
      _cachedWorkListingsByArea[areaId] = result.value;
      return Response.success(result.value);
    } else if (result is Error<List<WorkListing>>) {
      return Response.error(result.error);
    } else {
      return Response.error(Exception('Resultado inesperado'));
    }
  }

  Future<Response<List<WorkListing>>> searchByTerm(String term) {
    return _apiClient.searchWorkListings(term);
  }
}
