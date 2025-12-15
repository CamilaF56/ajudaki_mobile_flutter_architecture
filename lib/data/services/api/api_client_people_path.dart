import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/person_api_model.dart';
import 'api_client_path.dart';

class ApiClientPeoplePath extends ApiClientPath<PersonApiModel> {
  ApiClientPeoplePath()
      : super(
          resource: 'people',
          fromJson: PersonApiModel.fromJson,
        );
}