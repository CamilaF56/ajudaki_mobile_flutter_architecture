import '../../models/work_listing.dart';
import '../../utils/response.dart';
import '../services/api/api_client.dart';

class WorkListingRepository {
  WorkListingRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<Response<List<WorkListing>>> getAll() {
    return _apiClient.getWorkListings();
  }

  Future<Response<List<WorkListing>>> searchByTerm(String term) {
    return _apiClient.searchWorkListings(term);
  }

  Future<Response<List<WorkListing>>> getByAreaAtuacao(int areaId) {
    return _apiClient.getWorkListingsByCategory(areaId);
  }
}
