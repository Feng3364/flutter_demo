import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

class ContactsLogic extends GetxController {
  void pushCardPage(int index) {
    Get.toNamed(
      RouteName.card,
      arguments: {
        "userId": index.toString(),
        "username": "冯$index",
      },
    );
  }
}
