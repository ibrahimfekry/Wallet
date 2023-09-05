import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'default_text.dart';

class DefaultButton extends StatelessWidget{

  dynamic fontColor;
  dynamic backgroundColor;
  dynamic onTap;
  String? text;
  FontWeight? fontWeight;
  DefaultButton({super.key, this.fontColor, this.text, this.onTap, this.backgroundColor,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height : 40.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: DefaultText(
            text: text,
            fontColor: fontColor,
            fontSize: 16.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}