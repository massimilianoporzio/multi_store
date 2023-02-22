import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String label;
  final bool isSelected;

  const Category({
    required this.id,
    required this.label,
    this.isSelected = false,
  });

  Category copyWith({
    String? id,
    String? label,
    bool? isSelected,
  }) {
    return Category(
      id: id ?? this.id,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  String toString() =>
      'Category(id: $id, label: $label, isSelected: $isSelected)';

  @override
  List<Object> get props => [id, label, isSelected];
}

class SubCategory extends Category {
  final String imageUri;

  const SubCategory({
    required super.id,
    required this.imageUri,
    required super.label,
  });
}
