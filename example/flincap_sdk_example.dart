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
