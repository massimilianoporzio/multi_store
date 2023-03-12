import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:multi_store/core/errors/exceptions.dart';
import 'package:multi_store/features/categories/data/models/category_model.dart';

import '../../domain/entities/category_entity.dart';

abstract class LocalCategoriesDatasource {
  Future<List<Category>> getMainCategories({required int selectedIndex});
}

class LocalCategoriesDatasourceImpl implements LocalCategoriesDatasource {
  @override
  Future<List<Category>> getMainCategories({required int selectedIndex}) async {
    try {
      List<Category> results = [];
      final String response = await rootBundle
          .loadString('assets/categories/categories.json', cache: true);
      final data = await json.decode(response)["mainCategories"];

      results = List<Category>.from(data.map((e) => CategoryModel.fromMap(e)));
      // results = maincateg
      //     .asMap()
      //     .entries
      //     .map((e) => Category(id: e.key.toString(), label: e.value))
      //     .toList();
      // results = maincateg.map((e) => Category(id: e, label: e)).toList();
      //seleziono quello passato come parametro
      if (results.isNotEmpty) {
        results[selectedIndex] =
            results[selectedIndex].copyWith(isSelected: true);
      }
      return Future.value(results);
    } on Exception {
      throw LocalDatasourceException();
    }
  }
}
