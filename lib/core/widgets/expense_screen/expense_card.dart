import 'package:expense_app/core/constants/colors.dart';
import 'package:expense_app/core/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../../../models/expense.dart';
import '../../constants/icons.dart';
import './confirm_box.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async {
        showDialog(
          context: context,
          builder: (_) => ConfirmBox(exp: exp),
        );
      },
      child: ListTile(
        leading: Container(
          width: 50.w,
          height: 50.h,
          decoration:
              BoxDecoration(color: backGroundColor, shape: BoxShape.circle),
          child: Icon(icons[exp.category],size:25.r,color:primaryColor),
        ),
        title: DefaultText(
          text: exp.title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        subtitle:  DefaultText(
          text: DateFormat('MMMM dd, yyyy').format(exp.date),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        trailing:  DefaultText(
          text: NumberFormat.currency(locale: 'en_IN', symbol: '\$')
              .format(exp.amount),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontColor:redColor ,
        ),
      ),
    );
  }
}
