import 'work_type.dart';
import 'professional.dart';
import 'work_category.dart';

class WorkListing {
  final int idWorkListing;
  final String name;
  final String description;
  final double suggestedValue;
  final String? pictureUrl;
  final WorkCategory? category;
  final WorkType? type;
  final Professional? professional;

  WorkListing({
    required this.idWorkListing,
    required this.name,
    required this.description,
    required this.suggestedValue,
    this.pictureUrl,
    this.category,
    this.type,
    this.professional,
  });

  factory WorkListing.fromJson(Map<String, dynamic> json) {
    return WorkListing(
      idWorkListing: (json['idServico'] as num).toInt(),
      name: json['nome'],
      description: json['descricao'],
      suggestedValue: (json['valorSugerido'] as num).toDouble(),
      pictureUrl: json['fotoUrl'],
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
