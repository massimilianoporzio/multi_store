import 'package:multi_store/core/errors/exceptions.dart';

import '../../../../core/utils/categ_list.dart';
import '../../domain/entities/category_entity.dart';

abstract class LocalCategoriesDatasource {
  Future<List<Category>> getMainCategories({required int selectedIndex});
}

class LocalCategoriesDatasourceImpl implements LocalCategoriesDatasource {
  @override
  Future<List<Category>> getMainCategories({required int selectedIndex}) async {
    try {
      List<Category> results = [];

      results = maincateg.map((e) => Category(label: e)).toList();
      //seleziono quello passato come parametro
      if (results.isNotEmpty) {
        results[selectedIndex].isSelected = true;
      }
      return Future.value(results);
    } on Exception {
      throw LocalDatasourceException();
    }
  }
}
