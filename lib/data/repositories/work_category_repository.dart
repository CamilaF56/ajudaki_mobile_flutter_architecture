import '../../models/work_category.dart';
import '../../utils/response.dart';
import '../services/api/api_client.dart';

class WorkCategoryRepository {
  WorkCategoryRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  List<WorkCategory>? _cachedCategories;

  Future<Response<List<WorkCategory>>> getAll() async {
    if (_cachedCategories != null) {
      return Future.value(Response.success(_cachedCategories!));
    }

    final result = await _apiClient.getWorkCategory();

    if (result is Success<List<WorkCategory>>) {
      _cachedCategories = result.value;
      return Response.success(result.value);
    } else if (result is Error<List<WorkCategory>>) {
      return Response.error(result.error);
    } else {
      return Response.error(Exception('Resultado inesperado'));
    }
  }
}
