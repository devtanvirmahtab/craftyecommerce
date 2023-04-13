
import 'package:flutter/material.dart';

import '../../utiles/app_colors.dart';

class IncrementDecrementWidget extends StatefulWidget {
  const IncrementDecrementWidget({
    Key? key, required this.onChange,
  }) : super(key: key);

  final Function(int) onChange;

  @override
  State<IncrementDecrementWidget> createState() => _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {

  int currentValue = 0;
  @override
  void initState() {
    super.initState();
  }

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
                widget.onChange(currentValue);

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
              widget.onChange(currentValue);
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