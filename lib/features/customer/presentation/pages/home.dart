import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:multi_store/features/customer/presentation/widgets/category_tab.dart';
import 'package:multi_store/features/locale/presentation/cubit/locale_cubit.dart';
import 'package:recase/recase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 18,
          leading: IconButton(
            icon: Icon(
              Icons.translate_outlined,
              size: 18,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                BlocProvider.of<LocaleCubit>(context).toItalian();
              } else {
                BlocProvider.of<LocaleCubit>(context).toEnglish();
              }
            },
          ),
          title: const CupertinoSearchTextField(),
          bottom: TabBar(isScrollable: true, tabs: [
            CategoryTab(categoryName: 'men'),
            CategoryTab(categoryName: 'women'),
            CategoryTab(categoryName: 'shoes'),
            CategoryTab(categoryName: 'bags'),
            CategoryTab(categoryName: 'electronics'),
            CategoryTab(categoryName: 'accessories'),
            CategoryTab(categoryName: 'home & garden'),
            CategoryTab(categoryName: 'kids'),
            CategoryTab(categoryName: 'beauty'),
          ]),
        ),
        body: const TabBarView(children: [
          Center(
            child: Text('men screen'),
          ),
          Center(
            child: Text('women screen'),
          ),
          Center(
            child: Text('shoes screen'),
          ),
          Center(
            child: Text('bags screen'),
          ),
          Center(
            child: Text('electronics screen'),
          ),
          Center(
            child: Text('accessories screen'),
          ),
          Center(
            child: Text('home % garden screen'),
          ),
          Center(
            child: Text('kids screen'),
          ),
          Center(
            child: Text('beauty screen'),
          ),
        ]),
      ),
    );
  }
}
