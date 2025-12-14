import 'api_model.dart';

class WorkTypeApiModel extends ApiModel {
  final String name;
  final int workCategoryId;

  const WorkTypeApiModel({
    required super.id,
    required this.name,
    required this.workCategoryId
  });

  factory WorkTypeApiModel.fromJson(Map<String, dynamic> json) {
    return WorkTypeApiModel(
      id: json['id'] as int,
      name: json['name'] as String,
      workCategoryId: json['workCategoryId'] as int,
    );
  }
}