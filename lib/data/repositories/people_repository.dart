import 'package:ajudaki_mobile_flutter_architecture/domain/models/person.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/person_api_model.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/people_api_client.dart';
import 'repository.dart';

class PeopleRepository extends Repository<PersonApiModel, Person> {
  PeopleRepository() : super(PeopleApiClient());

  @override
  Person convert(PersonApiModel apiModel) {
    return Person(
      id: apiModel.id,
      name: apiModel.name,
      age: apiModel.age,
      phoneNumber: apiModel.phoneNumber
    );
  }
}