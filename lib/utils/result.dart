/// Representa o resultado de uma operação.
///
/// Pode ser um sucesso, contendo um valor do tipo [T],
/// ou um erro, contendo uma exceção.
sealed class Result<T> {
  /// Construtor base da resultado.
  const Result();

  /// Cria uma resultado de sucesso contendo o valor retornado.
  const factory Result.success(final T value) = Ok._;

  /// Cria uma resultado de erro contendo a exceção ocorrida.
  const factory Result.error(final Exception error) = Error._;
}

/// Representa uma resultado de sucesso.
final class Ok<T> extends Result<T> {
  /// Cria uma resultado de sucesso com o valor informado.
  const Ok._(this.value);

  /// Valor retornado pela operação.
  final T value;

  @override
  String toString() => 'Response<$T>.success($value)';
}

/// Representa uma resultado de erro.
final class Error<T> extends Result<T> {
  /// Cria uma resultado de erro com a exceção informada.
  const Error._(this.error);

  /// Exceção que descreve o erro ocorrido.
  final Exception error;

  @override
  String toString() => 'Response<$T>.error($error)';
}
