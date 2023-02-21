import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecases/base_usecase.dart';
import '../../../../core/errors/failures.dart';

import '../repositories/lang_repository.dart';

class ChangeLocaleUseCase implements BaseUseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLocaleUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepository.changeLang(langCode: langCode);
  }
}
