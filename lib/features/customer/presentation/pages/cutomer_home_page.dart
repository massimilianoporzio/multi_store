import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/core/routes/routes.dart';
import 'package:multi_store/features/customer/presentation/cubits/navigation/navigation_cubit.dart';
import 'package:multi_store/features/customer/presentation/widgets/customer_bottombar.dart';

class CustomerHomePage extends StatelessWidget {
  static const routeName = AppRoutes.customerHome;
  const CustomerHomePage({super.key});

  final List<Widget> _tabs = const [
    Center(
      child: Text('home screen'),
    ),
    Center(
      child: Text('categoty screen'),
    ),
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
