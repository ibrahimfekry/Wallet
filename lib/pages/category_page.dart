import 'package:expense_app/core/widgets/expense_form.dart';
import 'package:flutter/material.dart';

import 'category_fetcher.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  static const id = '/category page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Wallet'),
        centerTitle: true,
      ),
      body: const CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_)=> ExpenseForm());
      }),
    );
  }
}
