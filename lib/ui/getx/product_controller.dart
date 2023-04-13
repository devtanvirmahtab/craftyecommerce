import 'package:craftyecommerce/data/network_utiles.dart';
import 'package:craftyecommerce/data/urls.dart';
import 'package:get/get.dart';

import '../../data/models/product_model.dart';

class ProductController extends GetxController{
   ProductModel popularProductModel = ProductModel();
   ProductModel specialProductModel = ProductModel();
   ProductModel newProductModel = ProductModel();
   ProductModel productByCategoryModel = ProductModel();

   bool popularInProgress = false;
   bool specialInProgress = false;
   bool newInProgress = false;
   bool productByCategoryInProgress = false;

   Future<bool> getPopularProcuts()async{

     popularInProgress = true;
     update();
     final response = await NetworkUtiles().getMethod(Urls.productByRemarksUrl('popular'));
     popularInProgress = false;

     if(response != null && response['msg'] == 'success'){
       popularProductModel = ProductModel.fromJson(response);
       update();
       return true;
     }else{
       update();
       return false;
     }
   }

   Future<bool> getSpecialProcuts()async{

     specialInProgress = true;
     update();
     final response = await NetworkUtiles().getMethod(Urls.productByRemarksUrl('special'));
     specialInProgress = false;

     if(response != null && response['msg'] == 'success'){
       specialProductModel = ProductModel.fromJson(response);

       update();
       return true;
     }else{
       update();
       return false;
     }
   }

   Future<bool> getNewProcuts()async{

     newInProgress = true;
     update();
     final response = await NetworkUtiles().getMethod(Urls.productByRemarksUrl('popular'));
     newInProgress = false;

     if(response != null && response['msg'] == 'success'){
       newProductModel = ProductModel.fromJson(response);

       update();
       return true;
     }else{
       update();
       return false;
     }
   }

   Future<bool> getProductByCategory(String categoryId)async{

     productByCategoryInProgress = true;
     update();
     final response = await NetworkUtiles().getMethod(Urls.productByCategoryUrl(categoryId));

     productByCategoryInProgress = false;

     if(response != null && response['msg'] == 'success'){
       productByCategoryModel = ProductModel.fromJson(response);

       update();
       return true;
     }else{
       update();
       return false;
     }
   }

}