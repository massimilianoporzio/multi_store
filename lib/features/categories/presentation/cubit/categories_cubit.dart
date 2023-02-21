import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_store/core/errors/failures.dart';
import 'package:multi_store/features/categories/domain/usecases/get_main_categories.dart';

import '../../domain/entities/category_entity.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetMainCategoriesUseCase getMainCategoriesUseCase;

  CategoriesCubit({required this.getMainCategoriesUseCase})
      : super(CategoriesState.initial());

  void getMainCategories([int selectedIndex = 0]) async {
    emit(CategoriesState.initial()); //loading
    final results = await getMainCategoriesUseCase(
        SelectedCategoryParams(selectedIndex: selectedIndex));
    results.fold(
      (failure) => emit(state.copyWith(
          failure: failure,
          mainCategories: [],
          status: CategoriesStatus.error)),
      (mainCategories) => emit(state.copyWith(
          failure: null,
          mainCategories: mainCategories,
          status: CategoriesStatus.loaded)),
    );
  }
}
