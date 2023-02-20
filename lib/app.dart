import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/features/customer/presentation/cubits/navigation/navigation_cubit.dart';
import 'package:multi_store/features/customer/presentation/pages/cutomer_home_page.dart';

import 'core/services/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerNavigationCubit>(
            create: (context) => sl<CustomerNavigationCubit>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: CustomerHomePage.routeName,
        routes: {
          CustomerHomePage.routeName: (context) => const CustomerHomePage(),
        },
      ),
    );
  }
}
