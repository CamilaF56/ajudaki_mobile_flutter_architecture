import 'package:ajudaki_mobile_flutter_architecture/models/person.dart';

class Professional {
  final int professionalId;
  final Person? person;

  Professional({required this.professionalId, this.person});

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      professionalId: (json['idProfissional'] as num).toInt(),
      person: Person.fromJson(json['pessoa']),
    );
  }
}
