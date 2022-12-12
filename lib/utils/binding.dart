import 'package:enveu_movies/controllers/home_controller.dart';
import 'package:enveu_movies/controllers/search_controller.dart';
import 'package:enveu_movies/controllers/user_controller.dart';
import 'package:enveu_movies/controllers/welcome_controller.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController(), fenix: true);
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);

    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
