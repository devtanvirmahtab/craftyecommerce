import 'package:craftyecommerce/data/models/user_details.dart';
import 'package:craftyecommerce/data/network_utiles.dart';
import 'package:craftyecommerce/data/urls.dart';
import 'package:craftyecommerce/ui/getx/user_status_check_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/user_profile_model.dart';
import '../../main.dart';
import '../screens/auth_screens/email_auth_screen.dart';

class AuthController extends GetxController{
  bool authState = false;
  bool sendVerificationToEmailInProgress = false;
  bool verifyOTPInProgress = false;
  UserStatusCheckController userStatusCheckController = Get.put(UserStatusCheckController());

  void redirectUnAuthenticatedUser(){
    Navigator.push(
      CraftyBayApp.navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => const EmailAuthScreen(),
      ),
    );
  }

  bool checkAuthState(){
    if(!authState){
      redirectUnAuthenticatedUser();
      return false;
    }else{
      return true;
    }
  }

  Future<bool> sendVerificationCodeToEmail(String email) async {
    sendVerificationToEmailInProgress = true;
    update();
    final response = await NetworkUtiles().getMethod(Urls.sendOTPToEmail(email));
    sendVerificationToEmailInProgress = false;
    update();
    if(response != null && response["msg"] == "success"){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> verifyOTP(String email, String otp) async {
    verifyOTPInProgress = true;
    update();
    final response = await NetworkUtiles().getMethod(Urls.verifyOTPURL(email,otp));
    verifyOTPInProgress = false;
    update();
    if(response != null && response["msg"] == "success"){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> readProfileDetails() async {
    verifyOTPInProgress = true;
    update();
    final response = await NetworkUtiles().getMethod(Urls.readProfileUrl);
    verifyOTPInProgress = false;
    update();
    if(response != null && response["msg"] == "success"){
      ReadProfileModel readProfileModel = ReadProfileModel.fromJson(response);
      ProfileData profileData = readProfileModel.data?.first ?? ;
      UserDetails userDetails = UserDetails(firstName, lastName, shippingAddress, email, city, id, mobileNumber)
      userStatusCheckController.saveUserDetails(uDetails);
      return true;
    }else{
      return false;
    }
  }

}