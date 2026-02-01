import 'model.dart';

/// Representa um profissional no sistema.
///
/// Especializa a entidade [Professional].
class Professional extends Model {
  /// Cria uma instância de [Professional].
  Professional({
    required super.id,
    required this.name,
    required this.cpf,
    required this.phoneNumber,
    required this.cep,
    required this.pictureUrl,
  });

  /// Cria uma instância de [Professional] a partir de um JSON.
  factory Professional.fromJson(final Map<String, dynamic> json) {
    return Professional(
      id: json['Id'],
      name: json['Name'],
      cpf: json['Cpf'],
      phoneNumber: json['PhoneNumber'],
      cep: json['Cep'],
      pictureUrl: json['PictureUrl'],
    );
  }

  /// Nome da pessoa.
  final String name;

  /// CPF da pessoa.
  final String cpf;

  /// Número de telefone para contato.
  final String phoneNumber;

  /// CEP do endereço da pessoa.
  final String cep;

  /// URL da imagem de perfil da pessoa.
  final String pictureUrl;
}
