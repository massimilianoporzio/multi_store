import 'package:flutter/material.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:multi_store/core/utils/categ_list.dart';
import 'package:recase/recase.dart';

class CategoryTab extends StatelessWidget {
  final String categoryName;
  CategoryTab({super.key, required this.categoryName})
      : assert(maincateg.contains(categoryName));

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        categoryName.tr(context).sentenceCase,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
