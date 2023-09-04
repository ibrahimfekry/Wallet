import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../models/database_provider.dart';
import '../default_text.dart';

class ExpenseChart extends StatefulWidget {
  final String category;
  const ExpenseChart(this.category, {super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var maxY = db.calculateEntriesAndAmount(widget.category)['totalAmount'];
      var list = db.calculateWeekExpenses().reversed.toList();
      return BarChart(
        BarChartData(
          minY: 0,
          maxY: maxY,
          barGroups: [
            ...list.map(
                  (e) => BarChartGroupData(
                x: list.indexOf(e),
                barRods: [
                  BarChartRodData(
                    toY: e['amount'],
                    width: 20.0.w,
                    borderRadius: BorderRadius.zero,
                  ),
                ],
              ),
            ),
          ],
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              drawBelowEverything: true,
            ),
            leftTitles: const AxisTitles(
              drawBelowEverything: true,
            ),
            rightTitles: const AxisTitles(
              drawBelowEverything: true,
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) =>
                DefaultText(
                  text: DateFormat.E().format(list[value.toInt()]['day']),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}