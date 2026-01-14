import '../../../lib/data/repositories/work_listing_repository.dart';
import '../../../lib/models/work_listing.dart';
import '../../../lib/utils/response.dart';
import '../services/fake_api_client.dart';

class FakeWorkListingRepository extends WorkListingRepository {
  FakeWorkListingRepository() : super(FakeApiClient());

  Response<List<WorkListing>>? response;
  Response<List<WorkListing>>? filterResponse;

  @override
  Future<Response<List<WorkListing>>> getAll() async {
    return response ?? Response.success([]);
  }

  @override
  Future<Response<List<WorkListing>>> getByCategory(int categoryId) async {
    return filterResponse ?? Response.success([]);
  }

  @override
  Future<Response<List<WorkListing>>> getByTerm(String term) async {
    return response ?? Response.success([]);
  }
}