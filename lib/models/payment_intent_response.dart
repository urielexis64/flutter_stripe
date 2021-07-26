import 'dart:convert';

PaymentIntentResponse paymentIntentResponseFromJson(String str) =>
    PaymentIntentResponse.fromJson(json.decode(str));

String paymentIntentResponseToJson(PaymentIntentResponse data) =>
    json.encode(data.toJson());

class PaymentIntentResponse {
  PaymentIntentResponse({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.charges,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  Charges? charges;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  bool? livemode;
  Metadata? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) =>
      PaymentIntentResponse(
        id: json["id"] == null ? null : json["id"],
        object: json["object"] == null ? null : json["object"],
        amount: json["amount"] == null ? null : json["amount"],
        amountCapturable: json["amount_capturable"] == null
            ? null
            : json["amount_capturable"],
        amountReceived:
            json["amount_received"] == null ? null : json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod:
            json["capture_method"] == null ? null : json["capture_method"],
        charges:
            json["charges"] == null ? null : Charges.fromJson(json["charges"]),
        clientSecret:
            json["client_secret"] == null ? null : json["client_secret"],
        confirmationMethod: json["confirmation_method"] == null
            ? null
            : json["confirmation_method"],
        created: json["created"] == null ? null : json["created"],
        currency: json["currency"] == null ? null : json["currency"],
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        livemode: json["livemode"] == null ? null : json["livemode"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodOptions: json["payment_method_options"] == null
            ? null
            : PaymentMethodOptions.fromJson(json["payment_method_options"]),
        paymentMethodTypes: json["payment_method_types"] == null
            ? null
            : List<String>.from(json["payment_method_types"].map((x) => x)),
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"] == null ? null : json["status"],
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object": object == null ? null : object,
        "amount": amount == null ? null : amount,
        "amount_capturable": amountCapturable == null ? null : amountCapturable,
        "amount_received": amountReceived == null ? null : amountReceived,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod == null ? null : captureMethod,
        "charges": charges == null ? null : charges!.toJson(),
        "client_secret": clientSecret == null ? null : clientSecret,
        "confirmation_method":
            confirmationMethod == null ? null : confirmationMethod,
        "created": created == null ? null : created,
        "currency": currency == null ? null : currency,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "livemode": livemode == null ? null : livemode,
        "metadata": metadata == null ? null : metadata!.toJson(),
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_options": paymentMethodOptions == null
            ? null
            : paymentMethodOptions!.toJson(),
        "payment_method_types": paymentMethodTypes == null
            ? null
            : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status == null ? null : status,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
      };
}

class Charges {
  Charges({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  String? object;
  List<dynamic>? data;
  bool? hasMore;
  int? totalCount;
  String? url;

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        object: json["object"] == null ? null : json["object"],
        data: json["data"] == null
            ? null
            : List<dynamic>.from(json["data"].map((x) => x)),
        hasMore: json["has_more"] == null ? null : json["has_more"],
        totalCount: json["total_count"] == null ? null : json["total_count"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x)),
        "has_more": hasMore == null ? null : hasMore,
        "total_count": totalCount == null ? null : totalCount,
        "url": url == null ? null : url,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class PaymentMethodOptions {
  PaymentMethodOptions({
    this.card,
  });

  Card? card;

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "card": card == null ? null : card!.toJson(),
      };
}

class Card {
  Card({
    this.installments,
    this.network,
    this.requestThreeDSecure,
  });

  dynamic installments;
  dynamic network;
  String? requestThreeDSecure;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        installments: json["installments"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"] == null
            ? null
            : json["request_three_d_secure"],
      );

  Map<String, dynamic> toJson() => {
        "installments": installments,
        "network": network,
        "request_three_d_secure":
            requestThreeDSecure == null ? null : requestThreeDSecure,
      };
}
