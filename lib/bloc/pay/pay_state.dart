part of 'pay_bloc.dart';

@immutable
class PayState {
  final double payMount;
  final String currency;
  final bool activeCard;
  final CustomCreditCard? creditCard;

  PayState(
      {this.payMount = 0,
      this.currency = 'USD',
      this.activeCard = false,
      this.creditCard});

  PayState copyWith(
          {double? payMount,
          String? currency,
          bool? activeCard,
          CustomCreditCard? creditCard}) =>
      PayState(
          payMount: payMount ?? this.payMount,
          currency: currency ?? this.currency,
          activeCard: activeCard ?? this.activeCard,
          creditCard: creditCard ?? this.creditCard);
}
