import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxBool isMicIconShow = true.obs;
  RxBool isNoDataFound = true.obs;
  RxBool isFilterShow = false.obs;

  TextEditingController searchTextController = TextEditingController();
}
