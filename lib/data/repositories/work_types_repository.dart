import 'package:ajudaki_mobile_flutter_architecture/domain/models/work_type.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_type_api_model.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client_work_types_path.dart';
import 'repository.dart';
import 'work_categories_repository.dart';

class WorkTypesRepository extends Repository<WorkTypeApiModel, WorkType> {
  WorkTypesRepository() : super(ApiClientWorkTypesPath());

  @override
  Future<WorkType> convert(WorkTypeApiModel apiModel) async {
    final workCategoriesRepository = WorkCategoriesRepository();
    final workCategory = await workCategoriesRepository.get(apiModel.workCategoryId);
    return WorkType(
      id: apiModel.id,
      name: apiModel.name,
      workCategory: workCategory!
    );
  }
}