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
            height: 30,
            width: 195,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(244, 244, 244, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: TextStyle(fontSize: 14),
                  border: InputBorder.none,
                ),
                controller: searchController,
              ),
            ),
          ),
          IconButton(
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
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
