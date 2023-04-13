import 'package:craftyecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';

import '../screens/product_screen/product_details_screen.dart';
import '../utiles/app_colors.dart';

class ProductItemPreview extends StatelessWidget {
  const ProductItemPreview({
    Key? key, required this.productData,
  }) : super(key: key);

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(productId: productData.id ?? 0,)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: productData.image != null ?
                  Image.network( productData.image ?? '',height: 120,width: 120,fit: BoxFit.scaleDown)
                : const Icon(Icons.image),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productData.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('\$${productData.price}' ?? '',style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                  ),),
                  const SizedBox(width: 6),
                  Row(
                    children: [
                      Icon(Icons.star,size: 15,color: Colors.amber,),
                      Text('${productData.star ??  0.0}' ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                      child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: const Icon(Icons.favorite_outline_outlined,size: 14,color: Colors.white,)
                      )
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
}