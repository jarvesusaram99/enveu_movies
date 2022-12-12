import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class ShowingResult extends StatefulWidget {
  const ShowingResult({super.key});

  @override
  State<ShowingResult> createState() => _ShowingResultState();
}

class _ShowingResultState extends State<ShowingResult> {
  List resultImages = [
    "https://ntvb.tmsimg.com/assets/p8696131_b_h10_aa.jpg?w=1280&h=720",
    "https://www.tecnoandroid.it/wp-content/uploads/2022/04/stranger-things.jpg",
    "https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/07/lucifer-season-6.jpg",
    "https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/08/money-heist-season-5.jpg"
  ];

  List resultName = [
    "Breaking bad",
    "Stranger Things",
    "Lucifer(Season 6)",
    "Money Heist"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
      child: GetBuilder<SearchController>(builder: (value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Showing result for \"${value.searchTextController.text}\"",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            const SizedBox(
              height: 0,
            ),
            ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: resultImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: resultImages[index],
                            height: 80,
                            width: 160,
                            placeholder: (context, url) => const SizedBox(
                                height: 30,
                                width: 30,
                                child: CupertinoActivityIndicator()),
                            errorWidget: (e, b, c) =>
                                Container(color: Colors.black12),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          resultName[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            )
          ],
        );
      }),
    );
  }
}
