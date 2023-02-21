import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/features/categories/presentation/cubit/categories_cubit.dart';

import '../../domain/entities/category_entity.dart';

class SideNavigator extends StatelessWidget {
  final Size size;
  final List<Category> items;
  const SideNavigator({
    Key? key,
    required this.size,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.read<CategoriesCubit>().getMainCategories(index);
          },
          child: Container(
            color:
                items[index].isSelected ? Colors.white : Colors.grey.shade300,
            height: 100,
            child: Center(
                child: Text(
              items[index].label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            )),
          ),
        ),
      ),
    );
  }
}
