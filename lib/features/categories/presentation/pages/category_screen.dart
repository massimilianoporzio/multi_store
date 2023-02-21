import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:multi_store/features/categories/presentation/widgets/categories_view.dart';
import 'package:multi_store/features/categories/presentation/widgets/side_navigator.dart';
import 'package:multi_store/features/search/presentation/widgets/fake_search_app_bar.dart';

import '../../domain/entities/category_entity.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final List<Category> items;

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getMainCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const FakeSearchAppBar(),
      ),
      body: Stack(
        children: [
          BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Positioned(
                  bottom: 0,
                  left: 0,
                  child: SideNavigator(
                    items: state.mainCategories,
                    size: MediaQuery.of(context).size,
                  ));
            },
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CategoriesView(
                size: MediaQuery.of(context).size,
              )),
        ],
      ),
    );
  }
}
