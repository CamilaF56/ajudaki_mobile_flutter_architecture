import '../../models/work_category.dart';
import '../../utils/response.dart';
import '../services/api/api_client.dart';

class WorkCategoryRepository {
  WorkCategoryRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  List<WorkCategory>? cache;

  Future<Response<List<WorkCategory>>> getAll() async {
    if (cache != null) {
      return Future.value(Response.success(cache!));
    }

    final result = await _apiClient.getWorkCategories();

    return switch (result) {
      Success(value: final map) => () {
        final list = map.values.toList();
        cache = list;
        return Response.success(list);
      }(),
      Error(error: final error) => Response.error(error),
    };
  }
}