
import 'package:craftyecommerce/ui/getx/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../getx/bottom_navigation_controller.dart';
import '../../getx/category_controller.dart';
import '../../getx/home_controller.dart';
import '../../widgets/category_item_widget.dart';
import '../../widgets/home_widget/home_banner_slider.dart';
import '../../widgets/home_widget/section_header.dart';
import '../../widgets/product_item_preview_card.dart';
import '../product_screen/product_list.dart';
import '../product_screen/product_list_by_remarks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BottomNavigationController controller = Get.put(BottomNavigationController());
  ProductController pcontroller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset("assets/images/logo_nav.svg"),
        actions: [
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.person_outline,color: Colors.grey.shade700,size: 17,),
          ),
          const SizedBox(width: 7,),
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.phone_outlined,color: Colors.grey.shade700,size: 17,),
          ),
          const SizedBox(width: 7,),
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.notifications_active_outlined,color: Colors.grey.shade700,size: 17,),
          ),
          const SizedBox(width: 7,),
        ],
      ),
      body: SafeArea( 
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(.9)),
                  ),
                  prefixIcon:const Icon(Icons.search),
                  contentPadding:const EdgeInsets.symmetric(horizontal: 16,vertical: 9)
                ),
              ),
              const SizedBox(height: 10),
              /**** Banner Slider start*****/
              GetBuilder<HomeController>(
                builder: (homeController) {
                  if(homeController.getProductSliderInProgress){
                    return const CircularProgressIndicator();
                  }
                  return HomeBannerSlider(productSliderModel: homeController.productSliderModel,);
                }
              ),

              /**** Category start*****/
              const SizedBox(height: 10),
              SectionHeader(
                headerName: "Categories",
                seeOnTap: (){
                  controller.changeIndex(1);
                },
              ),
              const SizedBox(height: 10),
              GetBuilder<CategoryController>(
                builder: (category) {
                  if(category.getCategoryInProgress) {
                    return const Center(
                      child:  CircularProgressIndicator(),
                    );
                  }
                  else{
                    return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: category.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      return CategoryItemWidget(
                        categoryTitle: category.categoryModel.data![index].categoryName ?? "",
                        categoryImage: category.categoryModel.data![index].categoryImg ?? "",
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProductListScreen(
                                categoryId: '${category.categoryModel.data?[index].id??1}',
                                categoryName: category.categoryModel.data?[index].categoryName?? '',
                              )
                          ));
                          print('category id from home screen is here ${category.categoryModel.data![index].id }');
                        },
                      );
                    }),
                  );
                  }
                }
              ),
              /**** Category end*****/

              const SizedBox(height: 10),
              SectionHeader(
                  headerName: "Popular",
                  seeOnTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        ProductListByRemarksScreen(remarksName: 'popular',remarksModel: pcontroller.popularProductModel)));
                  }),
              const SizedBox(height: 10),
              /**** Popular Product *****/
              GetBuilder<ProductController>(
                builder: (productController) {
                  if(productController.popularInProgress){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else {
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.popularProductModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                            return ProductItemPreview(productData: productController.popularProductModel.data![index]);
                          },
                      ),
                    );
                  }
                }
              ),
              const SizedBox(height: 10),
              SectionHeader(
                  headerName: "Special",
                  seeOnTap: (){
                    print("special model");
                    print(pcontroller.newProductModel);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        ProductListByRemarksScreen(remarksName: 'special',remarksModel: pcontroller.specialProductModel,)));
                  }
              ),
              const SizedBox(height: 10),
              /**** Special Product *****/
              GetBuilder<ProductController>(
                  builder: (productController) {
                    if(productController.specialInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else {
                      return SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productController.specialProductModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductItemPreview(productData: productController.specialProductModel.data![index]);
                          },
                        ),
                      );
                    }
                  }
              ),
              const SizedBox(height: 10),
              SectionHeader(
                  headerName: "New",
                  seeOnTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        ProductListByRemarksScreen(remarksName: 'new',remarksModel: pcontroller.newProductModel)));
                  }),
              const SizedBox(height: 10),
              /**** New Product *****/
              GetBuilder<ProductController>(
                  builder: (productController) {
                    if(productController.newInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else {
                      return SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productController.newProductModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductItemPreview(productData: productController.newProductModel.data![index]);
                          },
                        ),
                      );
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}









