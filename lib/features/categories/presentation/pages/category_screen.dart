import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:multi_store/features/categories/presentation/widgets/men_category.dart';
import '../cubit/categories_cubit.dart';

import '../../../search/presentation/widgets/fake_search_app_bar.dart';

import '../../domain/entities/category_entity.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  late List<Category> items;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getMainCategories();
  }

  @override
  Widget build(BuildContext context) {
    items = context.watch<CategoriesCubit>().state.mainCategories;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const FakeSearchAppBar(),
          // title: const Text('prova'),
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: sideNavigator(
                  size: MediaQuery.of(context).size,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: categoriesView(
                  size: MediaQuery.of(context).size,
                )),
          ],
        ));
  }

  Widget sideNavigator({
    required Size size,
  }) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.decelerate);
          },
          child: Container(
            color:
                items[index].isSelected ? Colors.white : Colors.grey.shade300,
            height: 100,
            child: Center(
                child: Text(
              items[index].label.tr(context),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            )),
          ),
        ),
      ),
    );
  }

  Widget categoriesView({required Size size}) {
    return Container(
      color: Colors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          context.read<CategoriesCubit>().getMainCategories(index);
          // for (var element in items) {
          //   element.isSelected = false;
          // }
          // setState(() {
          //   items[index].isSelected = true;
          // });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategoryScreen(),
          Center(child: Text('women ctegory')),
          Center(child: Text('electronics ctegory')),
          Center(child: Text('accesories ctegory')),
          Center(child: Text('shoes ctegory')),
          Center(child: Text('home & garden ctegory')),
          Center(child: Text('beauty ctegory')),
          Center(child: Text('kids ctegory')),
          Center(child: Text('bags ctegory')),
        ],
      ),
    );
  }
}
