import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  final Size size;
  const CategoriesView({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          Center(child: Text('men ctegory')),
          Center(child: Text('women ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
          Center(child: Text('men ctegory')),
        ],
      ),
    );
  }
}
