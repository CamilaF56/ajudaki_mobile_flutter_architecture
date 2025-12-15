class WorkType {
  final int id;
  final String name;
  WorkType({required this.id, required this.name});

  factory WorkType.fromJson(Map<String, dynamic> json) {
    return WorkType(
      id: (json['idTipoServico'] as num).toInt(),
      name: json['nome'],
    );
  }
}
