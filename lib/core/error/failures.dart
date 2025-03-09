import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError([String? message]) = ServerFailure;
  const factory Failure.cacheError([String? message]) = CacheFailure;
  const factory Failure.networkError([String? message]) = NetworkFailure;
  const factory Failure.unexpectedError([String? message]) = UnexpectedFailure;
}
