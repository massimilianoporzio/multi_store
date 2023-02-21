import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';

import '../../../categories/presentation/pages/category_screen.dart';
import '../cubits/navigation/navigation_cubit.dart';
import '../widgets/customer_bottombar.dart';
import 'home.dart';

class CustomerHomePage extends StatelessWidget {
  static const routeName = AppRoutes.customerHome;
  const CustomerHomePage({super.key});

  final List<Widget> _tabs = const [
    HomeScreen(),
    CategoryScreen(),
    Center(
      child: Text('stores screen'),
    ),
    Center(
      child: Text('cart screen'),
    ),
    Center(
      child: Text('profile screen'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[context.watch<CustomerNavigationCubit>().state.currentIndex],
      bottomNavigationBar: const CustomerBottomBar(),
    );
  }
}
