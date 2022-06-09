part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends OrderEvent {
  String firstName;
  String lastName;
  List<CardProduct> cardProduct;
  String adres;
  String city;
  int postCode;
  String country;
  String email;
  String phone;

  CreateOrder({
    required this.firstName,
    required this.lastName,
    required this.cardProduct,
    required this.adres,
    required this.city,
    required this.postCode,
    required this.country,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        cardProduct,
        adres,
        city,
        postCode,
        country,
        email,
        phone,
      ];
}
