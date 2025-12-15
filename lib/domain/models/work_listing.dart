import 'model.dart';
import 'work_type.dart';
import 'person.dart';

class WorkListing extends Model {
  final WorkType workType;
  final Person creatorPerson;
  final String title;
  final String description;
  final String pictureUrl;
  final int estimatedPrice;

  WorkListing({
    required super.id,
    required this.workType,
    required this.creatorPerson,
    required this.title,
    required this.description,
    required this.pictureUrl,
    required this.estimatedPrice,
  });

  factory WorkListing.fromJson(Map<String, dynamic> json) {
    return WorkListing(
      id: json['id'] as int,
      workType: json['workType'] as WorkType,
      creatorPerson: json['creatorPerson'] as Person,
      title: json['title'] as String,
      description: json['description'] as String,
      pictureUrl: json['pictureUrl'] as String,
      estimatedPrice: json['estimatedPrice'] as int
    );
  }
}