import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client_path.dart';
import 'package:ajudaki_mobile_flutter_architecture/core/logger.dart';

abstract class Repository<TApi, T> {
  Repository(this.apiClientPath);

  final ApiClientPath<TApi> apiClientPath;

  Future<T?> convert(TApi apiModel);

  Future<Map<int, T?>> getAll() async {
    try {
      final data = await apiClientPath.getAll();
      if (data == null) return {};
      final result = <int, T?>{};
      for (final entry in data.entries) {
        result[entry.key] = await convert(entry.value);
      }
      return result;
    } catch (e) {
      Logger.instance.info('Repository getAll error $e');
      return {};
    }
  }

  Future<T?> get(int id) async {
    try {
      final data = await apiClientPath.get(id);
      if (data != null) return convert(data);
      return null;
    } catch (e) {
      Logger.instance.info('Repository get error $e');
      return null;
    }
  }
}