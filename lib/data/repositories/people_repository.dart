import 'package:ajudaki_mobile_flutter_architecture/domain/models/person.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/person_api_model.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client_people_path.dart';
import 'repository.dart';

class PeopleRepository extends Repository<PersonApiModel, Person> {
  PeopleRepository() : super(ApiClientPeoplePath());

  @override
  Future<Person> convert(PersonApiModel apiModel) async {
    return Person(
      id: apiModel.id,
      name: apiModel.name,
      age: apiModel.age,
      phoneNumber: apiModel.phoneNumber
    );
  }
}