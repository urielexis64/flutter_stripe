part of 'pay_bloc.dart';

@immutable
abstract class PayEvent {}

class OnCreditCardSelected extends PayEvent {
  final CustomCreditCard creditCard;

  OnCreditCardSelected(this.creditCard);
}

class OnDeactivateCreditCard extends PayEvent {}
