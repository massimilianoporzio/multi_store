import 'package:get_it/get_it.dart';
import 'package:multi_store/features/customer/presentation/cubits/navigation/navigation_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //*BLOCS/CUBITS

  //Navigation tabs for customers
  sl.registerFactory<CustomerNavigationCubit>(() => CustomerNavigationCubit());
}
