import "model.dart";

class WorkCategory extends Model {
  final String name;

  WorkCategory({
    required super.id,
    required this.name
  });

  factory WorkCategory.fromJson(Map<String, dynamic> json) {
    return WorkCategory(
      id: json['Id'],
      name: json['Name']
    );
  }
}