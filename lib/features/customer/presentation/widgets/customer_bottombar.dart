import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/features/customer/presentation/cubits/navigation/navigation_cubit.dart';

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
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        context.read<CustomerNavigationCubit>().setCurrentIndex(index);
      },
    );
  }
}
