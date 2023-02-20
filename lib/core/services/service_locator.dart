import 'package:get_it/get_it.dart';
import 'package:multi_store/features/customer/presentation/cubits/navigation/navigation_cubit.dart';
import 'package:multi_store/features/locale/data/datasources/lang_local_datasource.dart';
import 'package:multi_store/features/locale/data/repositories/lang_repository_impl.dart';
import 'package:multi_store/features/locale/domain/repositories/lang_repository.dart';
import 'package:multi_store/features/locale/domain/usecases/change_locale.dart';
import 'package:multi_store/features/locale/domain/usecases/get_saved_lang.dart';
import 'package:multi_store/features/locale/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*BLOCS/CUBITS

  //Navigation tabs for customers
  sl.registerFactory<CustomerNavigationCubit>(() => CustomerNavigationCubit());

  //Cubit per cambio linguaggio
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  //*usecases
  //RECUPERA IL LINGUAGGIO SALVATO
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  //CAMBIA IL LINGUAGGIO
  sl.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(langRepository: sl()));

  //*REPOSITORIES
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(localDS: sl()));

  //*DATASOURCES
  //cache per il linguaggio scelto
  sl.registerLazySingleton<LangLocalDS>(
      () => LangLocalDSImpl(sharedPreferences: sl()));

  //*EXTERNALS
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs); //registrata come singleton
}
