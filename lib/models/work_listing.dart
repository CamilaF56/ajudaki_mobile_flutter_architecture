class WorkListing {
  final int idWorkListing;
  final String name;
  final String description;
  final double suggestedValue;
  final String? pictureUrl;

  final int idWorkCategory;
  final String nameWorkCartegory;

  final int idWorkType;
  final String nameWorkType;

  final int idProfessional;
  final String nameProfessional;

  WorkListing({
    required this.idWorkListing,
    required this.name,
    required this.description,
    required this.suggestedValue,
    this.pictureUrl,
    required this.idWorkCategory,
    required this.nameWorkCartegory,
    required this.idWorkType,
    required this.nameWorkType,
    required this.idProfessional,
    required this.nameProfessional,
  });

  factory WorkListing.fromJson(Map<String, dynamic> json) {
    return WorkListing(
      idWorkListing: json['idServico'],
      name: json['nome'],
      description: json['descricao'],
      suggestedValue: (json['valorSugerido'] as num).toDouble(),
      pictureUrl: json['fotoUrl'],
      idWorkCategory: json['idAreaAtuacao'],
      nameWorkCartegory: json['nomeAreaAtuacao'],
      idWorkType: json['idTipoServico'],
      nameWorkType: json['nomeTipoServico'],
      idProfessional: json['idProfissional'],
      nameProfessional: json['nomeProfissional'],
    );
  }
}
