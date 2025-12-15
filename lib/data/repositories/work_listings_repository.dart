import 'package:ajudaki_mobile_flutter_architecture/domain/models/work_listing.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/models/work_listing_api_model.dart';
import 'package:ajudaki_mobile_flutter_architecture/data/services/api/api_client_work_listings_path.dart';
import 'repository.dart';
import 'work_types_repository.dart';
import 'people_repository.dart';

class WorkListingsRepository extends Repository<WorkListingApiModel, WorkListing> {
  WorkListingsRepository() : super(ApiClientWorkListingsPath());

  @override
  Future<WorkListing> convert(WorkListingApiModel apiModel) async {
      final workTypesRepository = WorkTypesRepository();
      final workType = await workTypesRepository.get(apiModel.workTypeId);
      final peopleRepository = PeopleRepository();
      final creatorPerson = await peopleRepository.get(apiModel.creatorPersonId);
      return WorkListing(
      id: apiModel.id,
      workType: workType!,
      creatorPerson: creatorPerson!,
      title: apiModel.title,
      description: apiModel.description,
      pictureUrl: apiModel.pictureUrl,
      estimatedPrice: apiModel.estimatedPrice,
    );
  }
}