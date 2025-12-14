import 'model.dart';

class Person extends Model {
  final String name;
  final int age;
  final String phoneNumber;

  Person({
    required super.id,
    required this.name,
    required this.age,
    required this.phoneNumber
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
}