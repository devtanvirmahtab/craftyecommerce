import 'package:craftyecommerce/ui/getx/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/bottom_navigation_controller.dart';
import '../../widgets/product_item_preview_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("Wishlist",style: TextStyle(color: Colors.black87),),
        leading: IconButton(
            onPressed: () {
              controller.changeIndex(0);
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black87,)),
      ),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          return Text('data');
          // return GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 7/8),
          //   itemCount: 20,
          //   itemBuilder: ( context,  index) {
          //     return ProductItemPreview(productData: ,);
          //   },
          // );
        }
      ),
    );
  }
}
