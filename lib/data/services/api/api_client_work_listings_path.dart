import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_listing_api_model.dart';
import 'api_client.dart';

class ApiClientWorkListingsPath extends ApiClient<WorkListingApiModel> {
  ApiClientWorkListingsPath()
      : super(
          resource: 'worklistings',
          fromJson: WorkListingApiModel.fromJson,
        );
}