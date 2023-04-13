import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utiles/app_colors.dart';

class ProductImageSlider extends StatelessWidget {
  final List<String> imageSlider;
  ProductImageSlider({Key? key, required this.imageSlider}) : super(key: key);

  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 230.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index,_){
              _currentSelectedIndex.value = index;
            },
          ),
          items: imageSlider.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      image:  DecorationImage(
                        image: NetworkImage(slider),
                        fit: BoxFit.scaleDown
                      )
                    ),
                    alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10,),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ValueListenableBuilder(valueListenable: _currentSelectedIndex, builder: (context, updatedvalue,_){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0;i<imageSlider.length;i++)
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: const EdgeInsets.all(3),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: i == _currentSelectedIndex.value ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: i == _currentSelectedIndex.value ? AppColors.primaryColor : Colors.white),
                      ),
                    )
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}