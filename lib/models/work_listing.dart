import 'model.dart';
import 'work_type.dart';
import 'professional.dart';

class WorkListing extends Model {
  final String title;
  final String description;
  final int estimatedPrice;
  final WorkType? workType;
  final Professional? professional;

  WorkListing({
    required super.id,
    required this.title,
    required this.description,
    required this.estimatedPrice,
    this.workType,
    this.professional,
  });

  factory WorkListing.fromJson(Map<String, dynamic> json) {
    return WorkListing(
      id: json['Id'],
      title: json['Title'],
      description: json['Description'],
      estimatedPrice: json['EstimatedPrice'],
      workType: WorkType.fromJson(json['WorkType']),
      professional: Professional.fromJson(json['Professional'])
    );
  }
}