import 'package:enveu_movies/controllers/home_controller.dart';
import 'package:enveu_movies/screens/account.dart';
import 'package:enveu_movies/screens/dowload_screen.dart';
import 'package:enveu_movies/screens/home_screens.dart';
import 'package:enveu_movies/screens/users_screen.dart';
import 'package:enveu_movies/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:enveu_movies/screens/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.find();

  List pages = [
    const HomeScreen(),
    const UsersScreen(),
    const DownloadScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            homeController.isHindi.value = !homeController.isHindi.value;
            homeController.isHindi.value
                ? Get.updateLocale(const Locale('en', 'US'))
                : Get.updateLocale(const Locale('hi', 'IN'));
          },
          child: const Icon(
            Icons.g_translate,
            color: Colors.white,
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(),
          padding:
              const EdgeInsets.only(top: 0, bottom: 20, left: 30, right: 30),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Obx(
                () => BottomNavigationBar(
                    selectedIconTheme:
                        const IconThemeData(color: kPrimaryColor),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.white),
                    showSelectedLabels: false,
                    elevation: 0, // to get rid of the shadow
                    currentIndex: 0,
                    selectedItemColor: Colors.amber[800],
                    onTap: (val) {
                      homeController.onItemTapped(val);
                    },
                    backgroundColor: Colors
                        .transparent, // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
                    type: BottomNavigationBarType.shifting,
                    unselectedItemColor: Colors.blue,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: homeController.selectedIndex.value == 0
                                ? kPrimaryColor
                                : null,
                          ),
                          child: Icon(Icons.home_outlined,
                              color: homeController.selectedIndex.value == 0
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: homeController.selectedIndex.value == 1
                                ? kPrimaryColor
                                : null,
                          ),
                          child: Icon(Icons.video_collection_sharp,
                              color: homeController.selectedIndex.value == 1
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        label: 'Videos',
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: homeController.selectedIndex.value == 2
                                ? kPrimaryColor
                                : null,
                          ),
                          child: Icon(Icons.download_outlined,
                              color: homeController.selectedIndex.value == 2
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        label: 'Notification',
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: homeController.selectedIndex.value == 3
                                ? kPrimaryColor
                                : null,
                          ),
                          child: Icon(Icons.manage_accounts,
                              color: homeController.selectedIndex.value == 3
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        label: 'Account',
                      ),
                    ]),
              )),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
          title: const Text("hulu",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0)),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.to(() => const SearchScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10),
                child: Image.asset(
                  "assets/icons/search.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/user.jpg",
                  fit: BoxFit.cover,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            const SizedBox(width: 20.0)
          ],
        ),
        body: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: homeController.pages[homeController.selectedIndex.value],
          ),
        ));
  }
}
