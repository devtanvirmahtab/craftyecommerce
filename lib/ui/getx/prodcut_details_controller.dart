import 'package:craftyecommerce/data/network_utiles.dart';
import 'package:craftyecommerce/data/urls.dart';
import 'package:get/get.dart';

import '../../data/models/product_details_model.dart';

class ProductDetailsController extends GetxController{
  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  bool getProductDetailsInProgress = false;

  Future<bool> getProductDetailsById(int productId)async{
    getProductDetailsInProgress = true;
    update();
    final response = await NetworkUtiles().getMethod(Urls.productDetailsByIdUrl(productId));
    getProductDetailsInProgress = false;
    if(response != null && response['msg'] == 'success'){
      productDetailsModel = ProductDetailsModel.fromJson(response);
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}