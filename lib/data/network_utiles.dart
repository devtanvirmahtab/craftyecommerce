import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkUtiles{

  /// get method for http request
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize})async{
    try{
      Uri uri = Uri.parse(url);
      final Response response = await get(uri,headers: {'token' : ''});
      log(response.body);
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else if(response.statusCode == 401){
        if(onUnAuthorize != null){
          onUnAuthorize();
        }
      }else{
        log('status code ${response.statusCode}');
      }
    }catch(e){
      log(e.toString());
    }
  }
  /// post method for http request
  Future<dynamic> postMethod(String url, {VoidCallback? onUnAuthorize,Map<String,String>? body})async{
    try{
      Uri uri = Uri.parse(url);
      final Response response = await post(uri,headers: {
        "Content-Type": "application/json",
        'token' : ''
      },body: body);
      log(response.body);
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else if(response.statusCode == 401){
        if(onUnAuthorize != null){
          onUnAuthorize();
        }
      }else{
        log('status code ${response.statusCode}');
      }
    }catch(e){
      log(e.toString());
    }
  }


}