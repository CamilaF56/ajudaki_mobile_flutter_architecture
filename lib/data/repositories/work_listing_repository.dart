import '../../models/work_listing.dart';
import '../../utils/result.dart';
import '../services/api/api_client.dart';

class WorkListingRepository {
  WorkListingRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<Result<List<WorkListing>>> getAll() {
    return _apiClient.getWorkListings();
  }

  Future<Result<List<WorkListing>>> searchByTerm(String term) {
    return _apiClient.searchWorkListings(term);
  }

  Future<Result<List<WorkListing>>> getByAreaAtuacao(int areaId) {
    return _apiClient.getWorkListingsByCategory(areaId);
  }
}
