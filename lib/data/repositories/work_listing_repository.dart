import "../../models/work_listing.dart";
import "../../utils/response.dart";
import "../services/api/api_client.dart";

class WorkListingRepository {
  WorkListingRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  List<WorkListing>? cache;

  Future<Response<List<WorkListing>>> getAll() async {
    if (cache != null) {
      return Future.value(Response.success(cache!));
    }

    final result = await _apiClient.getWorkListings();

    return switch (result) {
      Success(value: final map) => () {
        final list = map.values.toList();
        cache = list;
        return Response.success(list);
      }(),
      Error(error: final error) => Response.error(error),
    };
  }

  Future<Response<List<WorkListing>>> getByCategory(int categoryId) async {
    if (cache != null) {
      final filtered =
          cache!.where((workListing) => workListing.workType?.workCategory?.id == categoryId).toList();
      return Future.value(Response.success(filtered));
    }

    final result = await _apiClient.searchWorkListings(null, categoryId);

    return switch (result) {
      Success(value: final map) =>
        Response.success(map.values.toList()),
      Error(error: final error) =>
        Response.error(error),
    };
  }

  Future<Response<List<WorkListing>>> getByTerm(String terms) async {
    if (cache != null) {
      final filtered = cache!
          .where((workListing) => workListing.title.toLowerCase().contains(terms.toLowerCase()))
          .toList();
      return Future.value(Response.success(filtered));
    }

    final result = await _apiClient.searchWorkListings(terms, null);

    return switch (result) {
      Success(value: final map) =>
        Response.success(map.values.toList()),
      Error(error: final error) =>
        Response.error(error),
    };
  }
}