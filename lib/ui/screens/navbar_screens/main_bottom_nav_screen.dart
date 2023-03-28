import 'package:craftyecommerce/ui/getx/bottom_navigation_controller.dart';
import 'package:craftyecommerce/ui/getx/product_controller.dart';
import 'package:craftyecommerce/ui/screens/navbar_screens/home_screen.dart';
import 'package:craftyecommerce/ui/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/category_controller.dart';
import '../../getx/home_controller.dart';
import 'carts_screen.dart';
import 'category_screen.dart';
import 'wish_list_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({Key? key}) : super(key: key);

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());
  final List<Widget> screens = const [
    HomeScreen(),
    ProductCategoryScreen(),
    ProductCartScreen(),
    WishListScreen(),
  ];

  HomeController homeController = Get.put(HomeController());
  CategoryController categoryController = Get.put(CategoryController());
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.getProductSliderList();
      categoryController.getCategories();
      productController.getPopularProcuts();
      productController.getSpecialProcuts();
      productController.getNewProcuts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        builder: (_) {
          return screens[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: (index){
              controller.changeIndex(index);
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items:  [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp),label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard),label: "WishList"),
            ],
          );
        }
      ),
    );
  }
}
