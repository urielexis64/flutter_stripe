part of 'pay_bloc.dart';

@immutable
class PayState {
  final double amount;
  final String currency;
  final bool activeCard;
  final CustomCreditCard? creditCard;

  PayState(
      {this.amount = 300.00,
      this.currency = 'USD',
      this.activeCard = false,
      this.creditCard});

  String get amountString => '${(amount * 100).floor()}';

  PayState copyWith(
          {double? payMount,
          String? currency,
          bool? activeCard,
          CustomCreditCard? creditCard}) =>
      PayState(
          amount: payMount ?? this.amount,
          currency: currency ?? this.currency,
          activeCard: activeCard ?? this.activeCard,
          creditCard: creditCard ?? this.creditCard);
}
