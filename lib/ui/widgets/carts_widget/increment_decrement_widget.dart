
import 'package:flutter/material.dart';

import '../../utiles/app_colors.dart';

class IncrementDecrementWidget extends StatefulWidget {



  const IncrementDecrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<IncrementDecrementWidget> createState() => _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {

  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: (){

              if(currentValue == 0)
              {
                null;
              }else{
                currentValue--;
              }
              setState(() {

              });
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Icon(Icons.remove,size: 15,color: Colors.white,)
            )
        ),
        const SizedBox(width: 4),
        Text("$currentValue"),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: (){
              currentValue++;
              setState(() {

              });
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Icon(Icons.add,size: 15,color: Colors.white,)
            )
        ),
      ],
    );
  }
}