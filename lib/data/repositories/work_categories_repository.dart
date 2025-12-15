import 'package:ajudaki_mobile_flutter_architecture/domain/models/work_category.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_category_api_model.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client_work_categories_path.dart';
import 'repository.dart';

class WorkCategoriesRepository extends Repository<WorkCategoryApiModel, WorkCategory> {
  WorkCategoriesRepository() : super(ApiClientWorkCategoriesPath());

  @override
  Future<WorkCategory> convert(WorkCategoryApiModel apiModel) async {
    return WorkCategory(
      id: apiModel.id,
      name: apiModel.name
    );
  }
}