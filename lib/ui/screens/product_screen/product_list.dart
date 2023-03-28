import 'dart:ui';

import 'package:craftyecommerce/ui/getx/product_controller.dart';
import 'package:craftyecommerce/ui/widgets/product_item_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key, required this.categoryId}) : super(key: key);
  final String categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getProductByCategory(widget.categoryId);
      print('product id is here ${widget.categoryId}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Categories",style: TextStyle(color: Colors.black87),),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black87,)),
      ),
      body: GetBuilder<ProductController>(
        builder: (productController){
          if(productController.productByCategoryInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(productController.productByCategoryModel.data?.length == 0){
            return const Center(child: Text('No Products Found'));
          }
          else{
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 7/8
                ),
                itemCount:productController.productByCategoryModel.data?.length ?? 0,
                itemBuilder: (context,index){
                  return ProductItemPreview(productData: productController.productByCategoryModel.data![index]);
                }
            );
          }
        },
      ),
    );
  }
}
