import 'package:cached_network_image/cached_network_image.dart';
import 'package:enveu_movies/controllers/welcome_controller.dart';
import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final PageController pageController = PageController(initialPage: 0);
  WelcomeController welcomeController = Get.find();

  @override
  void initState() {
    pageController.addListener(() {
      welcomeController.page.value = pageController.page?.round() ?? 0;
    });
    super.initState();
  }

  List images = [
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_vl_3x/sources/r1/cms/prod/4483/674483-v",
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_vl_3x/sources/r1/cms/prod/2347/1282347-v-57b71e72275e",
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_vl_1_5x/sources/r1/cms/prod/5190/875190-v",
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/4906/1414906-h-146f8ccd3834"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Movie".tr,
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
          borderRadius: BorderRadius.circular(7.0),
          child: SizedBox(
            height: 220,
            child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    height: 400,
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        height: 80,
                        width: 160,
                        placeholder: (context, url) => const SizedBox(
                            height: 30,
                            width: 30,
                            child: CupertinoActivityIndicator()),
                        errorWidget: (e, b, c) =>
                            Container(color: Colors.black12),
                        fit: BoxFit.fitHeight,
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
