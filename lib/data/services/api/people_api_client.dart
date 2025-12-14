import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/person_api_model.dart';
import 'api_client.dart';

class PeopleApiClient extends ApiClient<PersonApiModel> {
  PeopleApiClient()
      : super(
          resource: 'people',
          fromJson: PersonApiModel.fromJson,
        );
}