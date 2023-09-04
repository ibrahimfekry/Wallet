import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class DefaultText extends StatelessWidget {
  DefaultText(
      {Key? key,
        this.text,
        this.textStyle,
        this.fontSize ,
        this.fontColor,
        this.fontWeight,
        this.maxLines,
        this.textHeight,
        this.fontFamily,
        this.scaleFactor,
      })
      : super(key: key);
  String? text;
  FontWeight? fontWeight;
  double? fontSize = 12;
  HexColor? fontColor = HexColor('#274268');
  dynamic textStyle;
  int? maxLines;
  double? textHeight;
  String? fontFamily;
  double? scaleFactor;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textScaleFactor: scaleFactor,
      style: textStyle ??
          TextStyle(

            fontSize: fontSize,
            color: fontColor,
            fontWeight: fontWeight,
            height: textHeight,
          ),
    );
  }
}