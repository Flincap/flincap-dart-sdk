import 'package:flincap_sdk/flincap_sdk.dart';
import 'package:test/test.dart';
import 'package:dotenv/dotenv.dart';

void main() {
  group('Flincap API Client Test', () {
    late FlincapApiClient flincapApi;
    var env = DotEnv(includePlatformEnvironment: true)..load();

    setUp(() {
      // Set up the FlincapApiClient before each test.
      flincapApi = FlincapApiClient(baseUrl: env['FLINCAP_URL'] ?? '', bearerToken: env['API_TOKEN'] ?? "");
    });

    test('Get Rate', () async {
      final rateResponse = await flincapApi.getRate('USDT', 'NGN');
      expect(rateResponse, isA<Map<String, dynamic>>());
      // Add more specific assertions based on the expected response from the API.
    });

    test('Get Exchange', () async {
      final exchangeResponse = await flincapApi.getExchange();
      expect(exchangeResponse, isA<Map<String, dynamic>>());
      // Add more specific assertions based on the expected response from the API.
    });

    // Add more test cases for other SDK methods, such as getExchange(), getTransaction(), and getHistory().
  });
}