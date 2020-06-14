import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses_app/data/db.dart';
import 'package:flutter_personal_expenses_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
    
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(
          catData.id, 
          catData.title, 
          catData.color
          );
      }).toList(),

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      )
    );
  }
}