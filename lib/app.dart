import 'package:flutter/material.dart';
import 'package:multi_store/features/customer/presentation/pages/cutomer_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CustomerHomePage.routeName,
      routes: {
        CustomerHomePage.routeName: (context) => const CustomerHomePage(),
      },
    );
  }
}
