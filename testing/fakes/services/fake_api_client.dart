import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client.dart';
import 'package:ajudaki_mobile_flutter_architecture/domain/work_listing.dart';
import 'package:ajudaki_mobile_flutter_architecture/domain/work_category.dart';
import 'package:ajudaki_mobile_flutter_architecture/utils/result.dart';

class FakeApiClient extends ApiClient {
  FakeApiClient() : super();

  @override
  Future<Result<Map<int, WorkListing>>> getWorkListings() async {
    return Result.success({
      1: WorkListing(
        id: 1,
        title: 'Trocar tomada',
        description: '',
        estimatedPrice: 50,
      ),
      2: WorkListing(
        id: 2,
        title: 'Instalar lâmpada',
        description: '',
        estimatedPrice: 40,
      ),
    });
  }

  @override
  Future<Result<Map<int, WorkListing>>> searchWorkListings(
    String? terms,
    int? workCategoryId,
  ) async {
    final result = await getWorkListings();
    final normalized = terms?.toLowerCase();

    return switch (result) {
      Ok(value: final map) => () {
        var entries = map.entries;

        if (normalized != null && normalized.isNotEmpty) {
          entries = entries.where(
            (e) => e.value.title.toLowerCase().contains(normalized),
          );
        }

        if (workCategoryId != null) {
          entries = entries.where(
            (e) =>
                e.value.workType?.workCategory != null &&
                e.value.workType?.workCategory!.id == workCategoryId,
          );
        }

        return Result.success(Map.fromEntries(entries));
      }(),
      Error(error: final error) => Result.error(error),
    };
  }

  @override
  Future<Result<Map<int, WorkCategory>>> getWorkCategories() async {
    return Result.success({
      1: WorkCategory(id: 1, name: 'Elétrica'),
      2: WorkCategory(id: 2, name: 'Hidráulica'),
    });
  }
}
