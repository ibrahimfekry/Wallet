import 'package:expense_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../../../models/expense_category.dart';
import '../../../pages/expense_page.dart';
import '../default_text.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExpenseScreen.name,
          arguments: category.title, // for expense screen.
        );
      },
      leading: Container(
        width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: backGroundColor,
            shape: BoxShape.circle
          ),
            child: Icon(category.icon,size:25.r,color:primaryColor)
      ),
      title: DefaultText(
        text: category.title,
        fontSize: 16.sp,
        fontWeight:FontWeight.w500 ,
      ),
      subtitle:  DefaultText(
      text:'entries: ${category.entries}',
      fontSize: 14.sp,
      fontWeight:FontWeight.w400 ,
    ),
      trailing:DefaultText(
        text:NumberFormat.currency(locale: 'en_IN', symbol: '\$ ')
        .format(category.totalAmount),
        fontSize: 14.sp,
        fontWeight:FontWeight.w600 ,
        fontColor: redColor,
      ),
    );
    
  }
}