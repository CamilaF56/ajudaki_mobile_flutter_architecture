import 'model.dart';
import 'work_type.dart';
import 'professional.dart';
import 'work_category.dart';

class WorkListing extends Model {
  final String name;
  final String description;
  final double suggestedValue;
  final WorkCategory? category;
  final WorkType? type;
  final Professional? professional;

  WorkListing({
    required super.id,
    required this.name,
    required this.description,
    required this.suggestedValue,
    this.category,
    this.type,
    this.professional,
  });

  factory WorkListing.fromJson(Map<String, dynamic> json) {
    return WorkListing(
      id: (json['idServico'] as num).toInt(),
      name: json['nome'],
      description: json['descricao'],
      suggestedValue: (json['valorSugerido'] as num).toDouble(),
      category: WorkCategory.fromJson(
        json['areaAtuacao'] as Map<String, dynamic>,
      ),
      type: WorkType.fromJson(json['tipoServico'] as Map<String, dynamic>),
      professional: Professional.fromJson(
        json['profissional'] as Map<String, dynamic>,
      ),
    );
  }
}
