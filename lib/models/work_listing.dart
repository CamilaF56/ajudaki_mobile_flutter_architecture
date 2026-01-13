import 'model.dart';
import 'work_type.dart';
import 'professional.dart';
import 'work_category.dart';

class WorkListing extends Model {
  final String title;
  final String description;
  final double estimatedPrice;
  final WorkType? type;
  final Professional? professional;

  WorkListing({
    required super.id,
    required this.title,
    required this.description,
    required this.estimatedPrice,
    this.type,
    this.professional,
  });

  factory WorkListing.fromJson(Map<String, dynamic> json) {
    return WorkListing(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      estimatedPrice: (json['estimatedPrice'] as num).toDouble(),
      type: WorkType.fromJson(json['workType'] as Map<String, dynamic>),
      professional: Professional.fromJson(
        json['profissional'] as Map<String, dynamic>,
      ),
    );
  }
}