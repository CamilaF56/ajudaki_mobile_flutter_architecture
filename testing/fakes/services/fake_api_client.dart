import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client.dart';
import 'package:ajudaki_mobile_flutter_architecture/models/work_listing.dart';
import 'package:ajudaki_mobile_flutter_architecture/models/work_category.dart';
import 'package:ajudaki_mobile_flutter_architecture/utils/response.dart';

class FakeApiClient extends ApiClient {
  FakeApiClient() : super(host: 'fake', port: 0);

  @override
  Future<Response<List<WorkListing>>> getWorkListings() async {
    return Response.success([
      WorkListing(
        id: 1,
        name: 'Trocar tomada',
        description: '',
        suggestedValue: 50,
      ),
      WorkListing(
        id: 2,
        name: 'Instalar lâmpada',
        description: '',
        suggestedValue: 40,
      ),
    ]);
  }

  @override
  Future<Response<List<WorkCategory>>> getWorkCategory() async {
    return Response.success([
      WorkCategory(id: 1, name: 'Elétrica'),
      WorkCategory(id: 2, name: 'Hidráulica'),
    ]);
  }

  @override
  Future<Response<List<WorkListing>>> searchWorkListings(String termo) async {
    final all = await getWorkListings();
    if (all is Success<List<WorkListing>>) {
      final filtered = all.value
          .where((s) => s.name.toLowerCase().contains(termo.toLowerCase()))
          .toList();
      return Response.success(filtered);
    }
    return Response.success([]);
  }

  @override
  Future<Response<List<WorkListing>>> getWorkListingsByCategory(
    int categoryId,
  ) async {
    final all = await getWorkListings();
    if (all is Success<List<WorkListing>>) {
      final filtered = all.value
          .where((s) => categoryId == 1 ? s.id == 1 : s.id == 2)
          .toList();
      return Response.success(filtered);
    }
    return Response.success([]);
  }
}
