import 'package:enveu_movies/screens/account.dart';
import 'package:enveu_movies/screens/dowload_screen.dart';
import 'package:enveu_movies/screens/home_screens.dart';
import 'package:enveu_movies/screens/users_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List pages = [
    const HomeScreen(),
    const UsersScreen(),
    const DownloadScreen(),
    const AccountScreen()
  ];
  void onItemTapped(index) {
    selectedIndex.value = index;
  }
}
