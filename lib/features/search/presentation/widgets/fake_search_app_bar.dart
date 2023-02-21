import 'package:flutter/material.dart';

import '../../../../core/localization/app_localization.dart';
import '../../../../core/utils/string_constants.dart';
import '../pages/search_screen.dart';

class FakeSearchAppBar extends StatelessWidget {
  const FakeSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.yellow,
            width: 1.4,
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Text(
                AppStrings.hintText.tr(context),
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          Container(
            height: 32,
            width: 75,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                AppStrings.search.tr(context),
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
