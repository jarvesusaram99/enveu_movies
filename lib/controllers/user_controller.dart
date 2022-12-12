import 'dart:convert';

import 'package:enveu_movies/models/users_model.dart';
import 'package:enveu_movies/rest/web_api_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getUsersDetailApi();
    super.onInit();
  }

  RxList<UsersModel> usersModel = <UsersModel>[].obs;
  getUsersDetailApi() async {
    isLoading.value = true;
    var request = http.Request('GET', Uri.parse(getBaseUrl + usersUrl));
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var b = jsonDecode(response.body);
      usersModel.clear();
      for (int i = 0; i < b.length; i++) {
        usersModel.add(UsersModel.fromJson(b[i]));
      }
    } catch (e) {
      Get.snackbar("Network Error", "Unable to connect server  ");
    }
    isLoading.value = false;
  }
}
