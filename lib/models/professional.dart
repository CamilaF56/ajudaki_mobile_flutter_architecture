import 'model.dart';
import 'person.dart';

class Professional extends Model {
  final Person? person;

  Professional({required super.id, this.person});

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      id: (json['idProfissional'] as num).toInt(),
      person: Person.fromJson(json['pessoa']),
    );
  }
}
