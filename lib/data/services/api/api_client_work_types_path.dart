import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_type_api_model.dart';
import 'api_client.dart';

class ApiClientWorkTypesPath extends ApiClient<WorkTypeApiModel> {
  ApiClientWorkTypesPath()
      : super(
          resource: 'worktypes',
          fromJson: WorkTypeApiModel.fromJson,
        );
}