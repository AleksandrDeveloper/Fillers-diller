part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends OrderEvent {
  final String firstName;
  final String lastName;
  final List<Product> cardProduct;
  final String adres;
  final String city;
  final String postCode;
  final String country;
  final String email;
  final String phone;

  const CreateOrder({
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
