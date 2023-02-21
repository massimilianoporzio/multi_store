import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecases/base_usecase.dart';
import '../../../../core/errors/failures.dart';

import '../repositories/lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await langRepository.getSavedLang();
  }
}
