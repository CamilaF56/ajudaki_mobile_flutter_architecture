import 'api_model.dart';

class PersonApiModel extends ApiModel {
  final String name;
  final int age;
  final String phoneNumber;

  PersonApiModel({
    required super.id,
    required this.name,
    required this.age,
    required this.phoneNumber
  });

  factory PersonApiModel.fromJson(Map<String, dynamic> json) {
    return PersonApiModel(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
}