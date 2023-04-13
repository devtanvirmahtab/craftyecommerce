import 'package:craftyecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/product_controller.dart';
import '../../widgets/product_item_preview_card.dart';

class ProductListByRemarksScreen extends StatefulWidget {
  final String remarksName;
  final ProductModel remarksModel;

  ProductListByRemarksScreen({Key? key, required this.remarksName, required this.remarksModel}) : super(key: key);

  @override
  State<ProductListByRemarksScreen> createState() => _ProductListByRemarksScreenState();
}

class _ProductListByRemarksScreenState extends State<ProductListByRemarksScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(widget.remarksName,style: TextStyle(color: Colors.black87),),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black87,)),
      ),
      body: (widget.remarksModel.data?.length ?? 0) == 0 ? const Center(child: Text('No Products Found')) :
             GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 6/8
                ),
                itemCount:widget.remarksModel.data?.length ?? 0,
                itemBuilder: (context,index){
                  return ProductItemPreview(productData: widget.remarksModel.data![index]);
                }
            )
    );
  }
}
