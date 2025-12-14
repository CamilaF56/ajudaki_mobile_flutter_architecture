import 'api_model.dart';

class WorkCategoryApiModel extends ApiModel {
  final String name;

  WorkCategoryApiModel({
    required super.id,
    required this.name
  });

  factory WorkCategoryApiModel.fromJson(Map<String, dynamic> json) {
    return WorkCategoryApiModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}