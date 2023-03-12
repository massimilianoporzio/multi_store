import 'dart:convert';

import 'package:multi_store/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.id, required super.label, super.isSelected = false});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'label': label});
    result.addAll({'isSelected': isSelected});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      label: map['label'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
