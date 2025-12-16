import 'model.dart';

class WorkType extends Model {
  final String name;
  WorkType({required super.id, required this.name});

  factory WorkType.fromJson(Map<String, dynamic> json) {
    return WorkType(
      id: (json['idTipoServico'] as num).toInt(),
      name: json['nome'],
    );
  }
}
