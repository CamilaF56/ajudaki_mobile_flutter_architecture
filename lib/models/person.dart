import 'model.dart';

class Person extends Model {
  final String name;
  final String cpf;
  final String phoneNumber;
  final String cep;
  final String pictureUrl;

  Person({
    required super.id,
    required this.name,
    required this.cpf,
    required this.phoneNumber,
    required this.cep,
    required this.pictureUrl
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      cpf: json['cpf'],
      phoneNumber: json['phoneNumber'],
      cep: json['cep'],
      pictureUrl: json['pictureUrl'],
    );
  }
}