import 'package:expense_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DefaultTextField extends StatefulWidget {
  DefaultTextField({
    Key? key,
    this.prefix,
    this.hintText,
    this.textInputType,
    this.height,
    this.suffix,
    this.color,
    this.controller,
    this.borderRadius,
    this.onSubmitted,
    this.onTap,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.helperText,
  }) : super(key: key);
  double? height;
  Widget? prefix;
  Widget? suffix;
  TextInputType? textInputType;
  String? hintText;
  Color? color;
  TextEditingController? controller;
  var onSubmitted;
  var onTap;
  var onChanged;
  double? borderRadius;
  bool obscureText;
  dynamic validator;
  String? helperText;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          validator: widget.validator,
          onFieldSubmitted: widget.onSubmitted,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,

          cursorColor: primaryColor,
          decoration:  InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            labelText:widget.hintText,
            labelStyle: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

