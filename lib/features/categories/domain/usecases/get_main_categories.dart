import 'package:dartz/dartz.dart';

import 'package:multi_store/core/domain/usecases/base_usecase.dart';
import 'package:multi_store/features/categories/domain/entities/category_entity.dart';
import 'package:multi_store/features/categories/domain/repositories/categories_repository.dart';

import '../../../../core/errors/failures.dart';

class SelectedCategoryParams {
  final int selectedIndex;
  SelectedCategoryParams({
    required this.selectedIndex,
  });
}

class GetMainCategoriesUseCase
    extends BaseUseCase<List<Category>, SelectedCategoryParams> {
  final CategoryRepository categoryRepository;

  GetMainCategoriesUseCase({
    required this.categoryRepository,
  });

  @override
  Future<Either<Failure, List<Category>>> call(
      SelectedCategoryParams params) async {
    return await categoryRepository.getMainCategories(
        selectedIndex: params.selectedIndex);
  }
}
