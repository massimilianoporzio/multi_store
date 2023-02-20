import 'package:multi_store/core/utils/string_constants.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class CacheFailure extends Failure {
  CacheFailure({super.message = AppStrings.cacheErrorMsg});
}

class GenericFailure extends Failure {
  GenericFailure({super.message = 'O'});
}
