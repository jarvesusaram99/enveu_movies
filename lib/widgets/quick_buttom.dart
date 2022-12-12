import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuickButton extends StatelessWidget {
  const QuickButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
          child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(4)),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(13),
              // padding: const EdgeInsets.only(
              // top: 10, left: 12, right: 12),
              width: Get.width,
              child: const Text(
                "Quick Search",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
