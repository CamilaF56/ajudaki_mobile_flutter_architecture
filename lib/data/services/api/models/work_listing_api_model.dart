import 'api_model.dart';

class WorkListingApiModel extends ApiModel {
  final int workTypeId;
  final int creatorId;
  final String title;
  final String description;
  final String picture;
  final int estimatedPrice;

  const WorkListingApiModel({
    required super.id,
    required this.workTypeId,
    required this.creatorId,
    required this.title,
    required this.description,
    required this.picture,
    required this.estimatedPrice
  });

  factory WorkListingApiModel.fromJson(Map<String, dynamic> json) {
    return WorkListingApiModel(
      id: json['id'] as int,
      workTypeId: json['workTypeId'] as int,
      creatorId: json['creatorId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      picture: json['picture'] as String,
      estimatedPrice: json['estimatedPrice'] as int,
    );
  }
}