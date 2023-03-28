import 'package:flutter/material.dart';

import '../../utiles/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key, required this.headerName, required this.seeOnTap,
  }) : super(key: key);
  final String headerName;
  final VoidCallback seeOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: .6
          ),
        ),
        TextButton(onPressed: seeOnTap,child: Text("See All",style:TextStyle(color: AppColors.primaryColor)),)
      ],
    );
  }
}