import 'package:ajudaki_mobile_flutter_architecture/data/repositories/work_category_repository.dart';
import 'package:ajudaki_mobile_flutter_architecture/models/work_category.dart';
import 'package:ajudaki_mobile_flutter_architecture/utils/response.dart';
import '../services/fake_api_client.dart';

class FakeWorkCategoryRepository extends WorkCategoryRepository {
  FakeWorkCategoryRepository() : super(FakeApiClient());

  Result<List<WorkCategory>>? response;

  @override
  Future<Result<List<WorkCategory>>> getAll() async {
    return response ?? Result.success([]);
  }
}
