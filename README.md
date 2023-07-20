# Flincap Dart SDK

[![npm shield](https://img.shields.io/pub/publisher/flincap_sdk)](https://pub.dev/packages/flincap_sdk)

The Flincap library provides access to the Flincap API in Dart/Flutter applications.

## Installation
To install add the lines below in your pubspec.yaml file.

```yaml
dependencies:
  flincap-sdk: ^x.x.x
```

## Usage

<!-- [![Open in StackBlitz](https://developer.stackblitz.com/img/open_in_stackblitz.svg)](https://stackblitz.com/github/Flincap/flincap-sdk/tree/main/examples/backend) -->

```dart
import 'package:flincap_sdk/flincap_sdk.dart';

void main() async {
  final flincapApi = FlincapApiClient(baseUrl: 'https://flincap.app/api', bearerToken: '<YOUR_FLINCAP_API_TOKEN>');

  try {
    // Example usage: Get Rate
    final rateResponse = await flincapApi.getRate('USDT', 'NGN');
    print(rateResponse);

    // Example usage: Create Transaction
    final transactionData = {
      'selectedCrypt': 'USDT',
      'selectedFiat': 'NGN',
      'email': 'user@example.com',
      'bankName': 'Example Bank',
      // Add other transaction data here...
    };
    final transactionResponse = await flincapApi.createTransaction(transactionData);
    print(transactionResponse);

    // You can use other SDK methods similarly to interact with other endpoints.
  } catch (e) {
    print('Error: $e');
  }
}

```

## Beta status

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning the package version to a specific version in your package.json file. This way, you can install the same version each time without breaking changes unless you are intentionally looking for the latest version.

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. We suggest [opening an issue](https://github.com/flincap/flincap-dart-sdk) first to discuss with us!

On the other hand, contributions to the README are always very welcome!