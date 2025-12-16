import 'model.dart';

class Person extends Model {
  final String name;
  final String cpf;
  final String cellphone;
  final String? telephone;
  final String cep;
  final String pictureUrl;

  Person({
    required super.id,
    required this.name,
    required this.cpf,
    required this.cellphone,
    this.telephone,
    required this.cep,
    required this.pictureUrl,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: (json['idpessoa'] as num?)?.toInt() ?? 0,
      name: json['nome'],
      cpf: json['cpf'],
      cellphone: json['celular'],
      telephone: json['telefone'],
      cep: json['cep'],
      pictureUrl: json['fotoUrl'],
    );
  }
}
