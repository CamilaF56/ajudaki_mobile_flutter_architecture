import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_listing_api_model.dart';
import 'api_client_path.dart';

class ApiClientWorkListingsPath extends ApiClientPath<WorkListingApiModel> {
  ApiClientWorkListingsPath()
      : super(
          resource: 'worklistings',
          fromJson: WorkListingApiModel.fromJson,
        );
}