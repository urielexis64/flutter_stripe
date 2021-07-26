import 'package:stripe_app/models/stripe_response.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  StripeService._();

  static final StripeService _instance = StripeService._();

  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  String _secretKey =
      'sk_test_51JHJGtCEFy4tnxrG0MUM60FDdp7uVtuDhwPU6EGBFJIUywXIEWSKvwoTQUnKXcHvgtfZeYILmaZyfGwYhB6NkApz00z96v0Ef6';
  String _publishableKey =
      'pk_test_51JHJGtCEFy4tnxrGORFNdUusgDiV8ccja7ubHDvXQBhFA9HUIXrTnUMKuK6Q60aQIvi1gVEYxjMkVnuCAh1xq2zy00Tlwg6AYd';

  void init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: _publishableKey,
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  Future payWithExistingCard(
      {required String amount,
      required String currency,
      required CreditCard card}) async {}

  Future<StripeResponse> payWithNewCard(
      {required String amount, required String currency}) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      return StripeResponse(ok: true);
    } catch (e) {
      return StripeResponse(ok: false, message: e.toString());
    }
  }

  Future payWithAppleOrGoogle(
      {required String amount, required String currency}) async {}

  Future _createPaymentIntent(
      {required String amount, required String currency}) async {}

  Future _makePayment(
      {required String amount,
      required String currency,
      required PaymentMethod paymentMethod}) async {}
}
