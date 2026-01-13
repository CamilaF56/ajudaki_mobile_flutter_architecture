import 'model.dart';
import 'work_category.dart';

class WorkType extends Model {
  final String name;
  final WorkCategory? workCategory;

  WorkType({
    required super.id,
    required this.name,
    required this.workCategory
  });

  factory WorkType.fromJson(Map<String, dynamic> json) {
    return WorkType(
      id: json['id'],
      name: json['nome'],
      workCategory: WorkCategory.fromJson(json['workCategoryId'] as Map<String, dynamic>),
    );
  }
}