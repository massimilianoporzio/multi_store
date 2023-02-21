part of 'categories_cubit.dart';

enum CategoriesStatus {
  loading,
  loaded,
  error;
}

class CategoriesState extends Equatable {
  final List<Category> mainCategories;
  final Failure? failure;
  final CategoriesStatus status;

  const CategoriesState({
    required this.mainCategories,
    this.failure,
    required this.status,
  });

  factory CategoriesState.initial() {
    return const CategoriesState(
        mainCategories: [],
        status: CategoriesStatus.loading,
        failure: null); //inizio con lista vuota
  }

  @override
  List<Object?> get props => [mainCategories, status, failure];

  @override
  String toString() =>
      'CategoriesState(mainCategories: $mainCategories, failure: $failure, status: $status)';

  CategoriesState copyWith({
    List<Category>? mainCategories,
    Failure? failure,
    CategoriesStatus? status,
  }) {
    return CategoriesState(
      mainCategories: mainCategories ?? this.mainCategories,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }
}
