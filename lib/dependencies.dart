import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../ui/work_listing/view_models/work_listing_view_model.dart';
import 'data/repositories/work_category_repository.dart';
import 'data/repositories/work_listing_repository.dart';
import 'data/services/api/api_client.dart';

List<SingleChildWidget> get providersRemote {
  final apiClient = ApiClient();

  return [
    Provider.value(value: apiClient),
    Provider(create: (_) => WorkCategoryRepository(apiClient)),
    Provider(create: (_) => WorkListingRepository(apiClient)),
    ChangeNotifierProvider(
      create: (final context) => WorkListingViewModel(
        workCategoryRepository: context.read(),
        workListingRepository: context.read(),
      ),
    ),
  ];
}