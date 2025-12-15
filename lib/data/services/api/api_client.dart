import 'api_client_health_path.dart';
import 'api_client_people_path.dart';
import 'api_client_work_categories_path.dart';
import 'api_client_work_listings_path.dart';
import 'api_client_work_types_path.dart';

class ApiClient {
  ApiClient() :
    health = ApiClientHealthPath(),
    people = ApiClientPeoplePath(),
    workCategories = ApiClientWorkCategoriesPath(),
    workListings = ApiClientWorkListingsPath(),
    workTypes = ApiClientWorkTypesPath();

  static const String host = 'localhost';
  static const int port = 5299;
  static const Duration timeout = Duration(seconds: 5);

  final ApiClientHealthPath health;
  final ApiClientPeoplePath people;
  final ApiClientWorkCategoriesPath workCategories;
  final ApiClientWorkListingsPath workListings;
  final ApiClientWorkTypesPath workTypes;
}