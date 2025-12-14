import 'api_model.dart';

class WorkListingApiModel extends ApiModel {
  final int workTypeId;
  final int creatorPersonId;
  final String title;
  final String description;
  final String pictureUrl;
  final int estimatedPrice;

  const WorkListingApiModel({
    required super.id,
    required this.workTypeId,
    required this.creatorPersonId,
    required this.title,
    required this.description,
    required this.pictureUrl,
    required this.estimatedPrice
  });

  factory WorkListingApiModel.fromJson(Map<String, dynamic> json) {
    return WorkListingApiModel(
      id: json['id'] as int,
      workTypeId: json['workTypeId'] as int,
      creatorPersonId: json['creatorPersonId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      pictureUrl: json['pictureUrl'] as String,
      estimatedPrice: json['estimatedPrice'] as int,
    );
  }
}