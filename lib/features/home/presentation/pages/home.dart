import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localization.dart';

import '../../../locale/presentation/cubit/locale_cubit.dart';

import '../../../search/presentation/widgets/fake_search_app_bar.dart';
import '../widgets/category_tab.dart';

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
          title: const FakeSearchAppBar(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              CategoryTab(categoryName: 'men'),
              CategoryTab(categoryName: 'women'),
              CategoryTab(categoryName: 'shoes'),
              CategoryTab(categoryName: 'bags'),
              CategoryTab(categoryName: 'electronics'),
              CategoryTab(categoryName: 'accessories'),
              CategoryTab(categoryName: 'home & garden'),
              CategoryTab(categoryName: 'kids'),
              CategoryTab(categoryName: 'beauty'),
            ],
          ),
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
            child: Text('home & garden screen'),
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
