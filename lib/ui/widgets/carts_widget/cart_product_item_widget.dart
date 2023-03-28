import 'package:flutter/material.dart';

import '../../utiles/app_colors.dart';
import 'increment_decrement_widget.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child:  Image.asset( "assets/images/shoes.png",height: 100,width: 120,fit: BoxFit.cover),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Name",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black.withOpacity(.6),fontSize: 18,fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height:8),
                            const Text(
                              "Color: Red, Size: X",
                              style: TextStyle(color: Colors.black54,fontSize: 13),
                            ),
                          ],
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                      ],
                    ),
                    const SizedBox(height:15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$900",style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),),
                        IncrementDecrementWidget(),
                      ],)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}