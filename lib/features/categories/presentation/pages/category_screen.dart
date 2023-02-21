import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/categories_cubit.dart';

import '../../../search/presentation/widgets/fake_search_app_bar.dart';

import '../../domain/entities/category_entity.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  PageController _pageController = PageController();

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
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const FakeSearchAppBar(),
            ),
            body: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: sideNavigator(
                        items: state.mainCategories,
                        size: MediaQuery.of(context).size,
                        selectedIndex: state.mainCategories
                            .indexWhere((element) => element.isSelected))),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: categoriesView(
                      size: MediaQuery.of(context).size,
                    )),
              ],
            ));
      },
    );
  }

  Widget sideNavigator(
      {required Size size,
      required List<Category> items,
      required int selectedIndex}) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.read<CategoriesCubit>().getMainCategories(index);
            _pageController.jumpToPage(selectedIndex);
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

  Widget categoriesView({required Size size}) {
    return Container(
      color: Colors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          context.read<CategoriesCubit>().getMainCategories(index);
        },
        scrollDirection: Axis.vertical,
        children: const [
          Center(child: Text('men ctegory')),
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
