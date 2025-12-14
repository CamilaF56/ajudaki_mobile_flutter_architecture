import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client.dart';
import 'package:ajudaki_mobile_flutter_architecture/core/logger.dart';

abstract class Repository<TApi, T> {
  Repository(this.apiClient);

  final ApiClient<TApi> apiClient;

  T convert(TApi apiModel);

  Future<Map<int, T>> getAll() async {
    try {
      final data = await apiClient.getAll();
      if (data != null) {
        return data.map((key, value) => MapEntry(key, convert(value)));
      }
      return {};
    } catch (e) {
      Logger.instance.info('Repository getAll error $e');
      return {};
    }
  }

  Future<T?> get(int id) async {
    try {
      final data = await apiClient.get(id);
      if (data != null) return convert(data);
      return null;
    } catch (e) {
      Logger.instance.info('Repository get error $e');
      return null;
    }
  }
}