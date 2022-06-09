import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:testfff/api_client/api_client.dart';

import '../../modal/card_product.dart';
import '../../modal/order_product.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final client = ApiClient();
  OrderBloc() : super(OrderLoading()) {
    List<OrderProduct> orderProduct = [];
    on<CreateOrder>((event, emit) async {
      orderProduct.add(OrderProduct(
          productId: event.cardProduct.first.productId,
          quantity: event.cardProduct.first.quantity));
      var userIdBox = await Hive.openBox<int>('userIdBox');
      final userId = userIdBox.get('userIdKey') as int;
      userIdBox.close();
      final createOrder = await client.createOrder(
        userId: userId,
        firstName: event.firstName,
        lastName: event.lastName,
        orderProduct: orderProduct,
        adres: event.adres,
        city: event.city,
        postCode: event.postCode,
        country: event.country,
        email: event.email,
        phone: event.phone,
      );
      print('object');
      emit(OrderGood(createOrder: createOrder));
    });
  }
}
