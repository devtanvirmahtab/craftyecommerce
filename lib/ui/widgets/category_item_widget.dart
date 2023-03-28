import 'package:flutter/material.dart';

import '../utiles/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key, required this.categoryTitle, required this.onTap, required this.categoryImage,
  }) : super(key: key);
  final String categoryTitle;
  final String categoryImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Container(
              child: Image.network(categoryImage,height: 50,width: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryColor.withOpacity(.18)
              ),
            ),
            const SizedBox(height: 10),
            Text(categoryTitle,style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400
            ),)
          ],
        ),
      ),
    );
  }
}