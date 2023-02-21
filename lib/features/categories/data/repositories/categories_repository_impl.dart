import 'package:dartz/dartz.dart';
import 'package:multi_store/core/errors/exceptions.dart';
import 'package:multi_store/core/errors/failures.dart';
import 'package:multi_store/features/categories/data/datasources/local_datasource_category.dart';
import 'package:multi_store/features/categories/domain/entities/category_entity.dart';
import 'package:multi_store/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoryRepository {
  final LocalCategoriesDatasource localDatasource;
  CategoriesRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, List<Category>>> getMainCategories(
      {required int selectedIndex}) async {
    try {
      final results =
          await localDatasource.getMainCategories(selectedIndex: selectedIndex);
      return Right(results);
    } on LocalDatasourceException {
      return Left(LocalDatasourceFailure());
    } on Exception {
      return Left(GenericFailure());
    }
  }
}
