import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:multi_store/core/utils/string_constants.dart';

import '../cubits/navigation/navigation_cubit.dart';

class CustomerBottomBar extends StatelessWidget {
  const CustomerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      type: BottomNavigationBarType.fixed,
      currentIndex: context.watch<CustomerNavigationCubit>().state.currentIndex,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: AppStrings.categories.tr(context)),
        const BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppStrings.profile.tr(context)),
      ],
      onTap: (index) {
        context.read<CustomerNavigationCubit>().setCurrentIndex(index);
      },
    );
  }
}
