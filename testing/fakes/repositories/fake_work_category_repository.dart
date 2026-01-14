import '../../../lib/data/repositories/work_category_repository.dart';
import '../../../lib/models/work_category.dart';
import '../../../lib/utils/response.dart';
import '../services/fake_api_client.dart';

class FakeWorkCategoryRepository extends WorkCategoryRepository {
  FakeWorkCategoryRepository() : super(FakeApiClient());

  /// Resposta configurável para os testes
  Response<List<WorkCategory>>? response;

  @override
  Future<Response<List<WorkCategory>>> getAll() async {
    return response ?? Response.success([]);
  }
}