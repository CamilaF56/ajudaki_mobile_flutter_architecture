import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_type_api_model.dart';
import 'api_client_path.dart';

class ApiClientWorkTypesPath extends ApiClientPath<WorkTypeApiModel> {
  ApiClientWorkTypesPath()
      : super(
          resource: 'worktypes',
          fromJson: WorkTypeApiModel.fromJson,
        );
}