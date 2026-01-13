sealed class Response<T> {
  const Response();

  const factory Response.success(T value) = Success._;

  const factory Response.error(Exception error) = Error._;
}

final class Success<T> extends Response<T> {
  const Success._(this.value);

  final T value;

  @override
  String toString() => 'Response<$T>.success($value)';
}

final class Error<T> extends Response<T> {
  const Error._(this.error);

  final Exception error;

  @override
  String toString() => 'Response<$T>.error($error)';
}