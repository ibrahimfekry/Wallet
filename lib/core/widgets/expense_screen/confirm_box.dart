import 'package:expense_app/core/constants/colors.dart';
import 'package:expense_app/core/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../models/database_provider.dart';
import '../../../models/expense.dart';

class ConfirmBox extends StatelessWidget {
  const ConfirmBox({
    Key? key,
    required this.exp,
  }) : super(key: key);

  final Expense exp;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      title: Row(
        children: [
          DefaultText(text: 'Delete '),
          DefaultText(
              text: '${exp.title} ?',
            fontColor:primaryColor,
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // don't delete
            },
            child: DefaultText(
              text: 'Don\'t delete',
              fontSize: 13.sp,
            ),
          ),
           SizedBox(width: 5.0.w),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true); // delete
              provider.deleteExpense(exp.id, exp.category, exp.amount);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor),
            ),
            child:  DefaultText(
              text:'Delete' ,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}