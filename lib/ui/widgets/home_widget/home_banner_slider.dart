import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftyecommerce/ui/widgets/product_widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_slider_model.dart';
import '../../utiles/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  HomeBannerSlider({Key? key, required this.productSliderModel}) : super(key: key);

  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);
  final ProductSliderModel productSliderModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index,_){
              _currentSelectedIndex.value = index;
            },
          ),
          items: productSliderModel.data?.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin:const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(slider.image?? '')
                      )
                    ),
                    alignment: Alignment.center,
                    child: const Text('text ', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10,),
        ValueListenableBuilder(valueListenable: _currentSelectedIndex, builder: (context, updatedvalue,_){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0;i<(productSliderModel.data?.length ?? 0);i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: const EdgeInsets.all(3),
                  height: 10,
                  width: i == _currentSelectedIndex.value ? 18 : 10,
                  decoration: BoxDecoration(
                    color: i == _currentSelectedIndex.value ? AppColors.primaryColor : null,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: i == _currentSelectedIndex.value ? AppColors.primaryColor : Colors.black26),
                  ),
                )
            ],
          );
        }),
      ],
    );
  }
}