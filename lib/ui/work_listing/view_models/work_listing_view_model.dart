import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../data/repositories/work_category_repository.dart';
import '../../../data/repositories/work_listing_repository.dart';
import '../../../models/work_category.dart';
import '../../../models/work_listing.dart';
import '../../../utils/response.dart';

class WorkListingViewModel extends ChangeNotifier {
  WorkListingViewModel({
    required final WorkListingRepository workListingRepository,
    required final WorkCategoryRepository workCategoryRepository,
  }) : _workListingRepository = workListingRepository,
      _workCategoryRepository = workCategoryRepository;

  final _log = Logger('WorkListingViewModel');

  final WorkListingRepository _workListingRepository;
  final WorkCategoryRepository _workCategoryRepository;

  // ---------- STATE ----------

  List<WorkListing> _listings = [];
  List<WorkCategory> _categories = [];
  WorkCategory? _selectedCategory;

  bool _isSearching = false;
  String _searchTerm = '';
  bool _isLoading = false;
  bool _isInitialized = false;

  bool _hasListingError = false;
  bool _hasCategoryError = false;

  // ---------- GETTERS ----------

  List<WorkListing> get listings => _listings;
  List<WorkCategory> get categories => _categories;
  WorkCategory? get selectedCategory => _selectedCategory;

  bool get isSearching => _isSearching;
  String get searchTerm => _searchTerm;
  bool get isLoading => _isLoading;

  bool get hasError => _hasListingError || _hasCategoryError;

  bool get hasListingError => _hasListingError;
  bool get hasCategoryError => _hasCategoryError;

  // ---------- LIFECYCLE ----------

  Future<void> init() async {
    if (_isInitialized) {
      return;
    }

    _isInitialized = true;

    await loadCategories();
    await loadAllListings();
  }

  // ---------- LOADERS ----------

  Future<void> loadCategories() async {
    _isLoading = true;
    _hasCategoryError = false;
    notifyListeners();

    final response = await _workCategoryRepository.getAll();

    if (response is Success<List<WorkCategory>>) {
      _categories = response.value;
    } else {
      _hasCategoryError = true;
      _log.warning('Falha ao carregar categorias');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadAllListings() async {
    _isLoading = true;
    _hasListingError = false;
    notifyListeners();

    final response = await _workListingRepository.getAll();

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _hasListingError = true;
      _log.warning('Falha ao carregar serviços');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadBackHome() async {
    _selectedCategory = null;
    await reload();
  }

  // ---------- SEARCH ----------

  Future<void> search(final String term) async {
    final trimmed = term.trim();

    if (trimmed.isEmpty) {
      await reload();
      return;
    }

    _isLoading = true;
    _hasListingError = false;
    notifyListeners();

    final response = await _workListingRepository.getByTerm(trimmed);

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _hasListingError = true;
      _log.warning('Busca falhou: "$trimmed"');
    }

    _isLoading = false;
    notifyListeners();
  }

  // ---------- FILTER ----------

  Future<void> filterByCategory(final WorkCategory? category) async {
    _selectedCategory = category;

    if (category == null) {
      await reload();
      return;
    }

    _isLoading = true;
    _hasListingError = false;
    notifyListeners();

    final response = await _workListingRepository.getByCategory(category.id);

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _hasListingError = true;
      _log.warning('Filtro falhou. CategoryId=${category.id}');
    }

    _isLoading = false;
    notifyListeners();
  }

  // ---------- RESET ----------

  Future<void> reset() async {
    _selectedCategory = null;
    await reload();
  }

  Future<void> reload() async {
    _isLoading = true;
    _hasListingError = false;
    notifyListeners();

    final response = await _workListingRepository.getAll();

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _hasListingError = true;
      _log.warning('Falha ao restaurar dados');
    }

    _isLoading = false;
    notifyListeners();
  }

  // ---------- SEARCH UI ----------

  Future<void> toggleSearch() async {
    _isSearching = !_isSearching;

    if (!_isSearching) {
      _searchTerm = '';
      await reset();
    }

    notifyListeners();
  }

  set searchTerm(final String value) {
    _searchTerm = value;
  }
}