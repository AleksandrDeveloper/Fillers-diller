import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/details_product/details_product_bloc.dart';
import '../modal/modals.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final int index;
  const ProductCardWidget({
    required this.product,
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => BlocProvider.of<DetailsProductBloc>(context)
          .add(GetDetailProduct(productId: product.id, context: context)),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.black, Colors.black54],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              product.name,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                product.regularPrice,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                width: 150,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.images[0].src == null
                          ? 'https://1ve19i29lklo3d9qyr26auc3-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/shutterstock_642137359-pdf.jpg'
                          : product.images[0].src),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
