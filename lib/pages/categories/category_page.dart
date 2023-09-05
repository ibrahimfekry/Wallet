import 'package:expense_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/widgets/category_screen/category_fetcher.dart';
import '../../core/widgets/default_text.dart';
import '../../core/widgets/expense_form.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const name = '/category_screen'; // for routes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  DefaultText(text:'Categories' ),
      ),
      body: const CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
        backgroundColor:primaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const ExpenseForm(),
          );
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}