import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/material.dart';

class CarouselDotScreen extends StatelessWidget {
  Color color;
  final int totalPages;
  final int index;
  CarouselDotScreen(
    this.index,
    this.totalPages,
    this.color, {
    Key? key,
  }) : super(key: key);
  // WelcomeController welcomeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(2),
          height: 8,
          width: index == this.index ? 16 : 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index == this.index ? kPrimaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
