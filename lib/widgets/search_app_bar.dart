import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/search_product/search_product_bloc.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width - 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Введите название товара',
                  hintStyle: TextStyle(fontSize: 14),
                  border: InputBorder.none,
                ),
                controller: searchController,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                final searchControllerText = searchController.text;
                BlocProvider.of<SearchProductBloc>(context).add(
                  GetProduct(
                      searchProductString: searchControllerText,
                      context: context),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xffffffff),
              ),
            ),
          )
        ],
      ),
    );
  }
}
