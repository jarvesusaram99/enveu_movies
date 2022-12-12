import 'package:enveu_movies/controllers/search_controller.dart';
import 'package:enveu_movies/widgets/features_chips..dart';
import 'package:enveu_movies/widgets/genere_chips.dart';
import 'package:enveu_movies/widgets/quick_buttom.dart';
import 'package:enveu_movies/widgets/ratings_chips.%20copy.dart';
import 'package:enveu_movies/widgets/showing_result.dart';
import 'package:enveu_movies/widgets/sort_chips..dart';
import 'package:enveu_movies/widgets/top_result..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController searchController = Get.find();

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
  void initState() {
    searchController.searchTextController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: Colors.black,
            centerTitle: false,
            backgroundColor: Colors.black,
            title: Container(
              height: 40,
              margin: const EdgeInsets.only(top: 12),
              // padding: const EdgeInsets.only(top: ),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white24.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                  autofocus: true,
                  controller: searchController.searchTextController,
                  onSubmitted: (values) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    fillColor: Colors.black,
                    enabled: true,
                    suffixIcon: AnimatedSwitcher(
                      reverseDuration: const Duration(seconds: 2),
                      duration: const Duration(milliseconds: 1000),
                      child: Obx(
                        (() => !searchController.isMicIconShow.value
                            ? const SizedBox()
                            : InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () {
                                  searchController.searchTextController.clear();
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(color: Colors.white70),
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: const Icon(Icons.clear,
                                        size: 12, color: Colors.white70),
                                  ),
                                ),
                              )),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search,
                        size: 19, color: Colors.white70),
                    contentPadding: const EdgeInsets.only(top: 5),
                    hintText: "Search for an ",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white54),
                  )),
            ),
            actions: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  searchController.isFilterShow.value = !searchController
                      .isFilterShow.value; // toggle the value of isFilterShow
                },
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 15, right: 20, left: 0, bottom: 5),
                    child: const Icon(Icons.filter_alt_outlined,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(
              overscroll: false, physics: const ClampingScrollPhysics()),
          child: SingleChildScrollView(
            child: Obx(() => searchController.isFilterShow.value
                ? AnimatedSwitcher(
                    duration: const Duration(seconds: 2),
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          GenereChips(),
                          SizedBox(
                            height: 20,
                          ),
                          FeaturesChips(),
                          SizedBox(
                            height: 20,
                          ),
                          RatingChips(),
                          SizedBox(
                            height: 20,
                          ),
                          SortChips(),
                          QuickButton(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                : searchController.searchTextController.text == ""
                    ? const TopResult()
                    : const ShowingResult()),
          ),
        ));
  }
}
