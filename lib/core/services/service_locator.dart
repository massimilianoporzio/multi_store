import 'package:get_it/get_it.dart';
import 'package:multi_store/features/categories/data/datasources/local_datasource_category.dart';
import 'package:multi_store/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:multi_store/features/categories/domain/repositories/categories_repository.dart';
import 'package:multi_store/features/categories/domain/usecases/get_main_categories.dart';
import 'package:multi_store/features/categories/presentation/cubit/categories_cubit.dart';

import '../../features/locale/data/datasources/lang_local_datasource.dart';
import '../../features/locale/data/repositories/lang_repository_impl.dart';
import '../../features/locale/domain/repositories/lang_repository.dart';
import '../../features/locale/domain/usecases/change_locale.dart';
import '../../features/locale/domain/usecases/get_saved_lang.dart';
import '../../features/locale/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/presentation/cubits/navigation/navigation_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*BLOCS/CUBITS

  //Navigation tabs for customers
  sl.registerFactory<CustomerNavigationCubit>(() => CustomerNavigationCubit());

  //Cubit per cambio linguaggio
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  //Cubit per le categorie principali
  sl.registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getMainCategoriesUseCase: sl()));

  //*usecases
  //RECUPERA IL LINGUAGGIO SALVATO
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  //CAMBIA IL LINGUAGGIO
  sl.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(langRepository: sl()));

  //RECUPERA LE CATEGORIES PRINCIPALI
  sl.registerLazySingleton<GetMainCategoriesUseCase>(
      () => GetMainCategoriesUseCase(categoryRepository: sl()));

  //*REPOSITORIES
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(localDS: sl()));

  sl.registerLazySingleton<CategoryRepository>(
      () => CategoriesRepositoryImpl(localDatasource: sl()));

  //*DATASOURCES
  //cache per il linguaggio scelto
  sl.registerLazySingleton<LangLocalDS>(
      () => LangLocalDSImpl(sharedPreferences: sl()));
  //lista delle categorie principali
  sl.registerLazySingleton<LocalCategoriesDatasource>(
      () => LocalCategoriesDatasourceImpl());

  //*EXTERNALS
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs); //registrata come singleton
}
