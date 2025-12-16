import 'model.dart';

class WorkCategory extends Model {
  final String name;
  final String? icon;

  WorkCategory({required super.id, required this.name, this.icon});

  factory WorkCategory.fromJson(Map<String, dynamic> json) {
    return WorkCategory(
      id: (json['idAreaAtuacao'] as num).toInt(),
      name: json['nome'],
      icon: json['icon'],
    );
  }
}
