import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getMainCategories(
      {required int selectedIndex});
}
