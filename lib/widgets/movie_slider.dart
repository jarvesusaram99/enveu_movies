// import 'dart:async';

// import 'package:enveu_movies/controllers/welcome_controller.dart';
// import 'package:enveu_movies/widgets/carousal_dot_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class MovieSlider extends StatefulWidget {
//   const MovieSlider({super.key});

//   @override
//   State<MovieSlider> createState() => _MovieSliderState();
// }

// class _MovieSliderState extends State<MovieSlider> {

//   @override


// // = Get.find();
//   List images = [
//     "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2022/09/black-adam-1663735185.jpg",
//     "https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/07/Upcoming-Marvel-Movies.jpg",
//     "https://www.looper.com/img/gallery/things-we-see-in-every-marvel-movie/intro-1553778419.jpg",
//     "https://media1.popsugar-assets.com/files/thumbor/L4QTcNHFDGceQ5ySzZzR90aNnm4/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2022/01/18/962/n/44498184/e20c23b8b90e0ecd_MCDAVEN_EC055/i/MCU-Movies-in-Chronological-Order.jpg"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 170.0,
//           child: PageView.builder(
//               controller: pageController,
//               itemCount: images.length,
//               reverse: false,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: CachedNetworkImage(
//                       imageUrl: images[index],
//                       placeholder: (context, url) => const SizedBox(
//                           height: 30,
//                           width: 30,
//                           child: CupertinoActivityIndicator()),
//                       errorWidget: (e, b, c) =>
//                           Container(color: Colors.black12),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               }),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Obx(
//             () => CarouselDotScreen(Get.find<WelcomeController>().page.value,
//                 images.length, Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
