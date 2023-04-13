import 'package:craftyecommerce/ui/utiles/app_colors.dart';
import 'package:craftyecommerce/ui/widgets/carts_widget/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_details_model.dart';
import '../../getx/prodcut_details_controller.dart';
import '../../widgets/appp_eleveted_button.dart';
import '../../widgets/product_widgets/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  ProductDetailsController  controller = Get.put(ProductDetailsController());
  Color? selectedColor ;
  String? selectedSize ;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getProductDetailsById(widget.productId);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text('Product Details',style: TextStyle(color: Colors.black),),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.getProductDetailsInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            final ProductDetailsData productDetailsData = productDetailsController.productDetailsModel.data!.first;
            final List<Color> availableColors = 
                getColorFromString(productDetailsData.color ?? '');
            final List<String> availableSizes = getSizesString(productDetailsData.size ?? '');
            if(totalAmount == 0){
              totalAmount = double.tryParse(productDetailsData.product?.price ?? '0.0') ?? 0.0;
            }

            return Column(
              children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(imageSlider: [
                        productDetailsData.img1 ?? '',
                        productDetailsData.img2 ?? '',
                        productDetailsData.img3 ?? '',
                        productDetailsData.img4 ?? '',
                      ],),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productDetailsData.product?.title ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 18,fontWeight: FontWeight.w600),
                                  ),
                                ),
                                IncrementDecrementWidget(
                                  onChange: (valueInt) {
                                    totalAmount = (double.tryParse(productDetailsData.product!.price!) ?? 0.0) * valueInt;
                                    print("total price $totalAmount");
                                    setState(() {

                                    });
                                  },)
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,color: Colors.amber,size: 18),
                                const SizedBox(width: 3),
                                Text((productDetailsData.product?.star ?? 0.0).toStringAsFixed(2) ),
                                const SizedBox(width: 8),
                                TextButton(onPressed: (){}, child: Text('Reviews',style: TextStyle(
                                  color: AppColors.primaryColor
                                ),)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: const Icon(Icons.favorite_outline_outlined,color: Colors.white,size: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Color",
                              style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 14,fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for(int i = 0; i<availableColors.length;i++)
                                    GestureDetector(
                                      onTap: (){
                                        selectedColor = availableColors[i];
                                        setState(() {

                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 7),
                                        child: CircleAvatar(
                                          backgroundColor: availableColors[i],
                                          radius: 13,
                                          child: selectedColor == availableColors[i] ? const Icon(Icons.check,size: 14) : null,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Size",
                              style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 14,fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for(int i = 0; i<availableSizes.length;i++)
                                    GestureDetector(
                                      onTap: (){
                                        selectedSize = availableSizes[i];
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        margin: const EdgeInsets.only(right: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(width: 2,color: Colors.black54)
                                        ),
                                        child: selectedSize == availableSizes[i] ? const Icon(Icons.check,size: 14) : Text(availableSizes[i],style: const TextStyle(fontSize: 11)),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Description",
                              style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 14,fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            Text(
                               productDetailsData.des ?? '',
                               style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 14,fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.18),
                    borderRadius:const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
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
                        Text("\$$totalAmount",style:TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        )),
                      ],
                    ),
                      SizedBox(width:120,child: AppElevatedButton(text: "Add to Cart", onTap: (){}))
                    ],
                  ),
                )
              ],
            );
          }
        }
      ),
    );
  }

  List<Color> getColorFromString(String colors){
    List<Color> hexColors = [];
    final List<String> allColors = colors.split(',');

    for(var element in allColors){
      hexColors.add(HexColor(element));
    }
    return hexColors;
  }

  List<String> getSizesString (String sizes){
    List<String> sizesList = [];
    final List<String> allSizes = sizes.split(',');
    for(var element in allSizes){
      sizesList.add(element);
    }
    return sizesList;
  }


}

