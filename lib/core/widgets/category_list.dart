import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/database_provider.dart';
import '../../models/expense_category.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
      return Consumer<DatabaseProvider>(
        builder: (_,db,__){
          var list = db.categories;
          return ListView.builder(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            itemCount: list.length,
            itemBuilder: (_,i) => CategoryCard(list[i]) ,
          );
        },
      );

  }
}

