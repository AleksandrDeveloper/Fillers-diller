import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/category_product/category_product_bloc.dart';
import '../modal/category_modal.dart';

class CategoryCardWidget extends StatelessWidget {
  final int index;
  final CategoryProduct category;
  const CategoryCardWidget({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<CategoryProductBloc>(context)
              .add(GetCategory(categoryId: category.id, context: context));
          print(category.id);
        },
        child: Container(
          width: 150,
          height: 50,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                category.name,
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
              )),
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(width: 2, color: Colors.red.shade300),
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
