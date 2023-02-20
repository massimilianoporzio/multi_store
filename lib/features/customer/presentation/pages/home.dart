import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:multi_store/features/locale/presentation/cubit/locale_cubit.dart';
import 'package:recase/recase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'men'.tr(context).sentenceCase,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Tab(
              child: Text(
                'women'.tr(context).sentenceCase,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Tab(
              child: Text(
                'shoes'.tr(context).sentenceCase,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            )
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
        ]),
      ),
    );
  }
}
