import '../../models/work_category.dart';
import '../../utils/result.dart';
import '../services/api/api_client.dart';

class WorkCategoryRepository {
  WorkCategoryRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  List<WorkCategory>? _cachedCategories;

  Future<Result<List<WorkCategory>>> getAll() async {
    if (_cachedCategories != null) {
      return Future.value(Result.ok(_cachedCategories!));
    }

    final result = await _apiClient.getWorkCategory();

    if (result is Ok<List<WorkCategory>>) {
      _cachedCategories = result.value;
      return Result.ok(result.value);
    } else if (result is Error<List<WorkCategory>>) {
      return Result.error(result.error);
    } else {
      return Result.error(Exception('Resultado inesperado'));
    }
  }
}
