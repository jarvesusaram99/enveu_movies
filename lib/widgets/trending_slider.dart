import 'package:enveu_movies/controllers/welcome_controller.dart';
import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingSlider extends StatefulWidget {
  List images;
  String heading;
  TrendingSlider({super.key, required this.images, required this.heading});

  @override
  State<TrendingSlider> createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  final PageController pageController = PageController(initialPage: 0);
  WelcomeController welcomeController = Get.find();

  @override
  void initState() {
    pageController.addListener(() {
      welcomeController.page.value = pageController.page?.round() ?? 0;
    });
    super.initState();
  }

  // List images = [
  //   "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/9468/1429468-h-c9c7354e71a9",
  //   "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/5034/1425034-h-f0508382d6a6",
  //   "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/8900/1418900-h-c9515a1e932f",
  //   "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/4906/1414906-h-146f8ccd3834"
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.heading,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0)),
            const Spacer(),
            Text(
              "More".tr,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            height: 110,
            // width: 210,
            child: ListView.builder(
                itemCount: widget.images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.images[index],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
