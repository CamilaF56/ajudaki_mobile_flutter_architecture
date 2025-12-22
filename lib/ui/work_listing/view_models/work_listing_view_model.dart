import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../../../data/repositories/work_listing_repository.dart';
import '../../../data/repositories/work_category_repository.dart';
import '../../../models/work_listing.dart';
import '../../../models/work_category.dart';
import '../../../utils/response.dart';

/// ViewModel responsável pelo estado e lógica de Work Listings.
class WorkListingViewModel extends ChangeNotifier {
  WorkListingViewModel({
    required WorkListingRepository workListingRepository,
    required WorkCategoryRepository workCategoryRepository,
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
  bool _hasError = false;
  bool _isInitialized = false;

  // ---------- GETTERS ----------

  List<WorkListing> get listings => _listings;
  List<WorkCategory> get categories => _categories;
  WorkCategory? get selectedCategory => _selectedCategory;

  bool get isSearching => _isSearching;
  String get searchTerm => _searchTerm;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  // ---------- LIFECYCLE ----------

  Future<void> init() async {
    if (_isInitialized) return;
    _isInitialized = true;

    await loadCategories();
    await loadAllListings();
  }

  // ---------- LOADERS ----------

  Future<void> loadCategories() async {
    _setLoading(true);

    final response = await _workCategoryRepository.getAll();

    if (response is Success<List<WorkCategory>>) {
      _categories = response.value;
    } else {
      _fail('Falha ao carregar categorias');
    }

    _setLoading(false);
  }

  Future<void> loadAllListings() async {
    _setLoading(true);

    final response = await _workListingRepository.getAll();

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _fail('Falha ao carregar serviços');
    }

    _setLoading(false);
  }

  Future<void> laodBackHome() async {
    _selectedCategory = null;
    await _reloadFromCache();
    loadAllListings();
  }

  // ---------- SEARCH ----------

  Future<void> search(String term) async {
    final trimmed = term.trim();

    if (trimmed.isEmpty) {
      await _reloadFromCache();
      return;
    }

    _setLoading(true);

    final response = await _workListingRepository.searchByTerm(trimmed);

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _fail('Busca falhou: "$trimmed"');
    }

    _setLoading(false);
  }

  // ---------- FILTER ----------

  Future<void> filterByCategory(WorkCategory? category) async {
    _selectedCategory = category;

    if (category == null) {
      await _reloadFromCache();
      return;
    }

    _setLoading(true);

    final response = await _workListingRepository.getByAreaAtuacao(category.id);

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _fail('Filtro falhou. CategoryId=${category.id}');
    }

    _setLoading(false);
  }

  // ---------- RESET ----------

  /// Volta ao estado inicial (dados em cache)
  Future<void> reset() async {
    _selectedCategory = null;
    await _reloadFromCache();
  }

  Future<void> _reloadFromCache() async {
    _setLoading(true);

    final response = await _workListingRepository.getAll();

    if (response is Success<List<WorkListing>>) {
      _listings = response.value;
    } else {
      _listings = [];
      _fail('Falha ao restaurar dados do cache');
    }

    _setLoading(false);
  }

  // ---------- SEARCH ----------

  void toggleSearch() {
    _isSearching = !_isSearching;

    if (!_isSearching) {
      _searchTerm = '';
      reset(); // volta para o estado inicial
    }

    notifyListeners();
  }

  void updateSearchTerm(String value) {
    _searchTerm = value;
  }

  // ---------- HELPERS ----------

  void _setLoading(bool value) {
    _isLoading = value;
    if (value) _hasError = false;
    notifyListeners();
  }

  void _fail(String message) {
    _hasError = true;
    _log.warning(message);
    notifyListeners();
  }
}
