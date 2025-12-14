import 'api_client_web_mobile.dart';

class HealthApiClient {
    Future<bool> get() async {
    final result = await ApiClientWebMobile.instance.get('/api/health');
    final statusCode = result['statusCode'] as int;

    if (statusCode != 200) return false;

    return true;
  }
}