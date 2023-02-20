import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_store/features/customer/presentation/cubits/navigation/navigation_cubit.dart';
import 'package:multi_store/features/customer/presentation/pages/cutomer_home_page.dart';
import 'package:multi_store/features/locale/presentation/cubit/locale_cubit.dart';

import 'core/localization/app_localization.dart';
import 'core/services/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerNavigationCubit>(
          create: (context) => sl<CustomerNavigationCubit>(),
        ),
        BlocProvider<LocaleCubit>(
          create: (context) => sl<LocaleCubit>()..getSavedLang(),
        )
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) =>
            previous != current, //solo quando i 2 linguaggi sono diversi
        builder: (context, state) {
          return MaterialApp(
            locale:
                state.locale, //il locale della app lo leggo dallo stato emesso
            supportedLocales: const [
              Locale('en', ""),
              Locale("it", ""),
            ],
            //*delegati: direzione del testo e traduzioni
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            //*serve per risolvere in che locale tradurre
            localeResolutionCallback: (currentLocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (currentLocal != null &&
                    currentLocal.languageCode == locale.languageCode) {
                  return currentLocal;
                }
              }
              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: CustomerHomePage.routeName,
            routes: {
              CustomerHomePage.routeName: (context) => const CustomerHomePage(),
            },
          );
        },
      ),
    );
  }
}
