import 'package:craftyecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/auth_screens/email_auth_screen.dart';
import 'auth_controller.dart';

class BottomNavigationController extends GetxController {
  AuthController authController = Get.put(AuthController());

  int selectedIndex = 0;

  void changeIndex(int index) {
    if (index == 2 || index == 3) {
        if(!authController.checkAuthState()){
          return;
        }
    }
    selectedIndex = index;
    update();
  }
}
