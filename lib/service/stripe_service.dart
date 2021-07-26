import 'package:dio/dio.dart';
import 'package:stripe_app/models/payment_intent_response.dart';
import 'package:stripe_app/models/stripe_response.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  StripeService._();

  static final StripeService _instance = StripeService._();

  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  static String _secretKey =
      'sk_test_51JHJGtCEFy4tnxrG0MUM60FDdp7uVtuDhwPU6EGBFJIUywXIEWSKvwoTQUnKXcHvgtfZeYILmaZyfGwYhB6NkApz00z96v0Ef6';
  String _publishableKey =
      'pk_test_51JHJGtCEFy4tnxrGORFNdUusgDiV8ccja7ubHDvXQBhFA9HUIXrTnUMKuK6Q60aQIvi1gVEYxjMkVnuCAh1xq2zy00Tlwg6AYd';

  final headerOptions = Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: {'Authorization': 'Bearer $_secretKey'});

  void init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: _publishableKey,
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  Future<StripeResponse> payWithExistingCard(
      {required String amount,
      required String currency,
      required CreditCard card}) async {
    try {
      final paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card));

      final response = await _makePayment(
          amount: amount, currency: currency, paymentMethod: paymentMethod);

      return response;
    } catch (e) {
      return StripeResponse(ok: false, message: e.toString());
    }
  }

  Future<StripeResponse> payWithNewCard(
      {required String amount, required String currency}) async {
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());

      final response = await _makePayment(
          amount: amount, currency: currency, paymentMethod: paymentMethod);

      return response;
    } catch (e) {
      return StripeResponse(ok: false, message: e.toString());
    }
  }

  Future<StripeResponse> payWithAppleOrGoogle(
      {required String amount, required String currency}) async {
    try {
      final appleFormatAmount = double.parse(amount) / 100;

      final androidPaymentRequest =
          AndroidPayPaymentRequest(currencyCode: currency, totalPrice: amount);
      final applePaymentOptions = ApplePayPaymentOptions(
          currencyCode: currency,
          countryCode: 'US',
          items: [
            ApplePayItem(
                label: 'Product 1', amount: '$appleFormatAmount', type: '')
          ]);

      final token = await StripePayment.paymentRequestWithNativePay(
          androidPayOptions: androidPaymentRequest,
          applePayOptions: applePaymentOptions);

      final paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: CreditCard(token: token.tokenId)));

      final response = await _makePayment(
          amount: amount, currency: currency, paymentMethod: paymentMethod);

      await StripePayment.completeNativePayRequest();

      return response;
    } catch (e) {
      return StripeResponse(ok: false, message: e.toString());
    }
  }

  Future<PaymentIntentResponse> _createPaymentIntent(
      {required String amount, required String currency}) async {
    try {
      final dio = Dio();
      final data = {'amount': amount, 'currency': currency};
      final resp =
          await dio.post(_paymentApiUrl, data: data, options: headerOptions);

      return PaymentIntentResponse.fromJson(resp.data);
    } catch (e) {
      print(e);
      return PaymentIntentResponse(status: '400');
    }
  }

  Future<StripeResponse> _makePayment(
      {required String amount,
      required String currency,
      required PaymentMethod paymentMethod}) async {
    try {
      final paymentIntent =
          await _createPaymentIntent(amount: amount, currency: currency);
      final paymentResult = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent.clientSecret,
              paymentMethodId: paymentMethod.id));

      if (paymentResult.status == 'succeeded') {
        return StripeResponse(ok: true);
      }

      return StripeResponse(
          ok: false, message: 'Payment failed: ${paymentResult.status}');
    } catch (e) {
      return StripeResponse(ok: false, message: e.toString());
    }
  }
}
