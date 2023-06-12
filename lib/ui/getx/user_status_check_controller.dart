import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_details.dart';

class UserStatusCheckController extends GetxController{
  bool loggedIn = false;
  UserDetails? userDetails;

  Future<void> saveUserDetails(UserDetails uDetails)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user', jsonEncode(uDetails.toJson()));
    userDetails = userDetails;
  }

  Future<void> getUserDetails()async{
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    String user = sharedPreferences.getString('user') ?? '';
    userDetails =  UserDetails.fromJson(jsonDecode(user));
  }
}