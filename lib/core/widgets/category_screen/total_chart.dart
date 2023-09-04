import 'package:expense_app/core/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/database_provider.dart';

class TotalChart extends StatefulWidget {
  const TotalChart({super.key});

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var list = db.categories;
      var total = db.calculateTotalExpenses();
      return Row(
        children: [
          Expanded(
            flex: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  child:
                  DefaultText(
                    text:'Total Expenses: ${NumberFormat.currency(locale: 'en_IN', symbol: '\$').format(total)}' ,
                    fontWeight: FontWeight.bold,
                    scaleFactor: 1.5,
                  ),
                ),
                SizedBox(height: 8.0.h),
                ...list.map(
                  (e) => Padding(
                    padding:  EdgeInsets.all(3.0.h),
                    child: Row(
                      children: [
                        Container(
                          width: 8.0.w,
                          height: 8.0.h,
                          color: Colors.primaries[list.indexOf(e)],
                        ),
                         SizedBox(width: 5.0.w),
                        DefaultText(
                          text: e.title,
                        ),
                         SizedBox(width: 5.0.w),
                        DefaultText(
                          text: total == 0
                              ? '0%'
                              : '${((e.totalAmount / total) * 100).toStringAsFixed(2)}%',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 40,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 20.0.r,
                sections: total != 0
                    ? list.map(
                          (e) => PieChartSectionData(
                            showTitle: false,
                            value: e.totalAmount,
                            color: Colors.primaries[list.indexOf(e)],
                          ),
                        ).toList()
                    : list.map(
                          (e) => PieChartSectionData(
                            showTitle: false,
                            color: Colors.primaries[list.indexOf(e)],
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
