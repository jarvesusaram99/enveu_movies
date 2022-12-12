import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:enveu_movies/controllers/welcome_controller.dart';
import 'package:enveu_movies/widgets/carousal_dot_screen.dart';
import 'package:enveu_movies/widgets/movies_list.dart';
import 'package:enveu_movies/widgets/trending_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List moviesList = [
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/9468/1429468-h-c9c7354e71a9",
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/5034/1425034-h-f0508382d6a6",
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/8900/1418900-h-c9515a1e932f",
    "https://img1.hotstarext.com/image/upload/f_auto,t_web_hs_3x/sources/r1/cms/prod/4634/1394634-h-d7c72ffdcf76"
  ];

  List trendingList = [
    "https://occ-0-4994-2164.1.nflxso.net/dnm/api/v6/6gmvu2hxdfnQ55LZZjyzYR4kzGk/AAAABZ3I954wM01JgXLed_awur8jfc9AH65vL-erC0BASmpOX8A0sxHM14Ic35Emp492mCpjQztvZZ4cTvrxxmgg_8BK3JDU3DdyW5fIrBiCegy9tfs8kek1IMpvOVTqq9nYmAN4.jpg?r=983",
    "https://occ-0-4994-2164.1.nflxso.net/dnm/api/v6/6gmvu2hxdfnQ55LZZjyzYR4kzGk/AAAABY24gA02M-MZxodT3ZwY0y2RdmIpMeFQL-cexNMzvU_XqL2E7Rc9hBxPZaIaUzlOhDgXHUoo3uFH-EJp9RMV-3OtbPg9QGyS2LcZEIFsSlrKbi6V5epOzSKId0-xsdM9tdd9cgFkboWCCpf7sC6jHFxfxMH9NZluPqW38N2mNNvcCe4mRuC15DO6RalE4OX5Yasc5CoRChRrG-HkXlXYHuLkQSJe2Hy3J6b1B3rAxzrzGwIFNfZS3fdEdq4a4ZimJSlZTN0C-gclCRZU1SifFxWSgohXiNf0p6rMmCb4ZRjclN5vP9vwHFM_e4qTvXcbp2hyr0qCgDzwHZWlFjZOCIhFWcklqxrmP_jLAsPiEIEAii19m3SWHUiWun_Sws_JhtxCH0RNk3XtfYETLGET_l0ZH30Av-3wRR3ctZQt-Y3SxKnA.webp?r=6e2",
    "https://occ-0-4994-2164.1.nflxso.net/dnm/api/v6/6gmvu2hxdfnQ55LZZjyzYR4kzGk/AAAABdTaFUt74e0yoFwDZ5X9qOIKr5tOFVksI4lrbXzP7P5pMkcoa4ALj4aqAhzOopDeJiLjHxjO_zdGflZV1GZRNdNNiJegwBGeu-0Iax5BLNol0aXNBH24-BpNc9nh9pow7RVi.jpg?r=92f",
    "https://occ-0-6246-2164.1.nflxso.net/dnm/api/v6/6gmvu2hxdfnQ55LZZjyzYR4kzGk/AAAABTrVVWswxzdC8X-IsUZZ0zA2M8_68Oettph1h4HAYzaKGQOl_fCTC5uF6DV5J-S2kpUpB4jCoN_ThzsNHrae26Zb-W8iucTnD2OoohuhWb0PfpZti7pBnBre0r1xD5K2nTk1.jpg?r=c3c"
  ];
  List images = [
    "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2022/09/black-adam-1663735185.jpg",
    "https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/07/Upcoming-Marvel-Movies.jpg",
    "https://www.looper.com/img/gallery/things-we-see-in-every-marvel-movie/intro-1553778419.jpg",
    "https://media1.popsugar-assets.com/files/thumbor/L4QTcNHFDGceQ5ySzZzR90aNnm4/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2022/01/18/962/n/44498184/e20c23b8b90e0ecd_MCDAVEN_EC055/i/MCU-Movies-in-Chronological-Order.jpg"
  ];

  final PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.85);
  WelcomeController welcomeController = Get.find();
  int _currentPage = 1;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    pageController.addListener(() {
      welcomeController.page.value = pageController.page?.round() ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 170.0,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: images.length,
                          reverse: false,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CachedNetworkImage(
                                  imageUrl: images[index],
                                  placeholder: (context, url) => const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CupertinoActivityIndicator()),
                                  errorWidget: (e, b, c) =>
                                      Container(color: Colors.black12),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Obx(
                        () => CarouselDotScreen(
                            Get.find<WelcomeController>().page.value,
                            images.length,
                            Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TrendingSlider(
                  images: moviesList,
                  heading: "Popular Movies",
                ),
                const SizedBox(
                  height: 20,
                ),
                const MoviesList(),
                const SizedBox(
                  height: 20,
                ),
                TrendingSlider(
                  images: trendingList,
                  heading: "Supernatural TV Shows",
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ));
  }
}
