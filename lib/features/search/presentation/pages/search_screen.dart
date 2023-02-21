import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:multi_store/core/utils/string_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: CupertinoSearchTextField(
          placeholder: AppStrings.search.tr(context),
        ),
      ),
    );
  }
}
