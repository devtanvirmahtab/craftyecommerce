import 'package:craftyecommerce/ui/screens/auth_screens/email_auth_screen.dart';
import 'package:craftyecommerce/ui/widgets/appp_eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/auth_controller.dart';
import '../../getx/bottom_navigation_controller.dart';
import '../../utiles/app_colors.dart';
import '../../widgets/carts_widget/cart_product_item_widget.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({Key? key}) : super(key: key);

  @override
  State<ProductCartScreen> createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());
  AuthController authController = Get.put(AuthController());
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*****
      //check login or not
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if(!authController.authState){
          controller.changeIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const EmailAuthScreen()));
        }
      });
     *******/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text("Carts",style: TextStyle(color: Colors.black87),),
        leading: IconButton(
            onPressed: () {
              controller.changeIndex(0);
            },
            icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black87,)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return   CartProductItemWidget();
              },

            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.18),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Total Price",style:TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    )),
                    const SizedBox(height: 5),
                    Text("\$8000",style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                    )),
                  ],
                ),
                SizedBox(width:100,child: AppElevatedButton(text: "Checkout", onTap: (){}))
              ],
            ),
          )
        ],
      ),
    );
  }
}




