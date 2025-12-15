class WorkCategory {
  final int id;
  final String nome;

  WorkCategory({required this.id, required this.nome});

  factory WorkCategory.fromJson(Map<String, dynamic> json) {
    return WorkCategory(id: json['idAreaAtuacao'], nome: json['nome']);
  }
}
