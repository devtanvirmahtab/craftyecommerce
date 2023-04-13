import 'package:craftyecommerce/ui/getx/bottom_navigation_controller.dart';
import 'package:craftyecommerce/ui/getx/category_controller.dart';
import 'package:craftyecommerce/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../product_screen/product_list.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {

  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Categories",style: TextStyle(color: Colors.black87),),
        leading: IconButton(
            onPressed: () {
              controller.changeIndex(0);
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black87,)),
      ),
      body: GetBuilder<CategoryController>(
        builder: (category) {
        if(category.getCategoryInProgress){
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
            onRefresh: ()async{
              category.getCategories();
            },
          child:  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
            itemCount: category.categoryModel.data?.length ?? 0,
            itemBuilder: ( context,  index) {
            return CategoryItemWidget(
            categoryTitle: category.categoryModel.data![index].categoryName ?? "",
            categoryImage: category.categoryModel.data![index].categoryImg ?? "",
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ProductListScreen(
                    categoryId: '${category.categoryModel.data![index].id ?? 1}',
                    categoryName: category.categoryModel.data?[index].categoryName?? '',
                  ) ));
                });
              },
            )
          );
        },
      )
    );
  }
}
