import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_category_api_model.dart';
import 'api_client_path.dart';

class ApiClientWorkCategoriesPath extends ApiClientPath<WorkCategoryApiModel> {
  ApiClientWorkCategoriesPath()
      : super(
          resource: 'workcategories',
          fromJson: WorkCategoryApiModel.fromJson,
        );
}