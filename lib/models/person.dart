class Person {
  final int personId;
  final String name;
  final String cpf;
  final String cellphone;
  final String? telephone;
  final String cep;

  Person({
    required this.personId,
    required this.name,
    required this.cpf,
    required this.cellphone,
    this.telephone,
    required this.cep,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      personId: (json['idPessoa'] as num?)?.toInt() ?? 0,
      name: json['nome'],
      cpf: json['cpf'],
      cellphone: json['celular'],
      telephone: json['telefone'],
      cep: json['cep'],
    );
  }
}
