import 'model.dart';
import 'work_category.dart';

class WorkType extends Model {
  final String name;
  final WorkCategory workCategory;

  WorkType({
    required super.id,
    required this.name,
    required this.workCategory
  });

  factory WorkType.fromJson(Map<String, dynamic> json) {
    return WorkType(
      id: json['id'] as int,
      name: json['name'] as String,
      workCategory: json['workCategory'] as WorkCategory
    );
  }
}