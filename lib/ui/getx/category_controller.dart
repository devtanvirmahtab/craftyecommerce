import 'package:craftyecommerce/data/network_utiles.dart';
import 'package:craftyecommerce/data/urls.dart';
import 'package:get/get.dart';

import '../../data/models/category_model.dart';

class CategoryController extends GetxController{
  CategoryModel  categoryModel = CategoryModel();
  bool getCategoryInProgress = false;

  Future<bool> getCategories()async{
    getCategoryInProgress = true;
    update();
    final response = await NetworkUtiles().getMethod(Urls.productCategoryUrl);
    getCategoryInProgress = false;
    if(response != null){
      categoryModel = CategoryModel.fromJson(response);
      update();
      return true;
    }else{
      getCategoryInProgress = false;
      update();
      return false;
    }
  }
}