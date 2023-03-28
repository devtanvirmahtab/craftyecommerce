import 'package:craftyecommerce/data/network_utiles.dart';
import 'package:get/get.dart';

import '../../data/models/product_slider_model.dart';
import '../../data/urls.dart';

class HomeController extends GetxController{
  ProductSliderModel productSliderModel = ProductSliderModel();
  bool getProductSliderInProgress = false;

  Future<bool> getProductSliderList()async{
    getProductSliderInProgress  = true;
    update();
    final result = await NetworkUtiles().getMethod(Urls.productSliderUrl);
    getProductSliderInProgress = false;

    if(result != null){
      productSliderModel = ProductSliderModel.fromJson(result);
      update();
      return true;
    }else{
      getProductSliderInProgress = false;
      update();
      return false;

    }
  }
}