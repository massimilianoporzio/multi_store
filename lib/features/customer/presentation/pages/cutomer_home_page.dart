import 'package:flutter/material.dart';
import 'package:multi_store/core/routes/routes.dart';
import 'package:multi_store/features/customer/presentation/widgets/customer_bottombar.dart';

class CustomerHomePage extends StatelessWidget {
  static const routeName = AppRoutes.customerHome;
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomerBottomBar(),
    );
  }
}
