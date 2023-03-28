import 'package:craftyecommerce/ui/utiles/app_colors.dart';
import 'package:craftyecommerce/ui/widgets/carts_widget/increment_decrement_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/appp_eleveted_button.dart';
import '../../widgets/product_widgets/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('Product Details',style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
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
                                "Nike Sports shoes N54443 upto 30% discount offer",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 18,fontWeight: FontWeight.w600),
                              ),
                            ),
                            IncrementDecrementWidget()
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,color: Colors.amber,size: 18),
                            const SizedBox(width: 3),
                            const Text('4.8'),
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
                              for(int i = 0; i<10;i++)
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.primaryColor,
                                    radius: 13,
                                    child: Icon(Icons.check),
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
                              for(int i = 0; i<10;i++)
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(width: 2,color: Colors.black54)
                                  ),
                                  child:const  Text("XL",style: TextStyle(fontSize: 11)),
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
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
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
                SizedBox(width:120,child: AppElevatedButton(text: "Add to Cart", onTap: (){}))
              ],
            ),
          )
        ],
      ),
    );
  }
}
