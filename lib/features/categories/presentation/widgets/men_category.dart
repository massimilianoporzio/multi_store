import 'package:flutter/material.dart';
import 'package:multi_store/core/localization/app_localization.dart';
import 'package:recase/recase.dart';

class MenCategoryScreen extends StatelessWidget {
  const MenCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.12, //con 0.68 fa 0.8 che è l'altezza del parent
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'men'.tr(context).sentenceCase,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            mainAxisSpacing: 70,
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            children: List.generate(
                4,
                (index) => Column(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset('assets/images/men/men$index.jpg'),
                        ),
                        const Text('shirt'),
                      ],
                    )),
          ),
        ),
      ],
    );
  }
}
