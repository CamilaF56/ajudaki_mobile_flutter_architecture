import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/work_listing_view_model.dart';
import 'work_listing_entry.dart';
import 'work_listing_filters.dart';
import 'work_listing_top_bar.dart';

class WorkListingScreen extends StatefulWidget {
  const WorkListingScreen({super.key});

  @override
  State<WorkListingScreen> createState() => _WorkListingScreenState();
}

class _WorkListingScreenState extends State<WorkListingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WorkListingViewModel>().init();
    });
  }

  @override
  Widget build(final BuildContext context) {
    final vm = context.watch<WorkListingViewModel>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 236, 237, 1),
      body: Column(
        children: [
          const WorkListingTopBar(),
          const Divider(
            height: 1,
            thickness: 2,
            color: Color.fromRGBO(171, 186, 255, 1),
          ),
          WorkListingFilters(
            categories: vm.categories,
            selectedCategory: vm.selectedCategory,
            onCategoryChanged: vm.filterByCategory,
          ),
          Expanded(child: _buildBody(vm)),
        ],
      ),
    );
  }

  Widget _buildBody(final WorkListingViewModel vm) {
    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.hasError) {
      return const Center(child: Text('Erro ao carregar os serviços'));
    }

    if (vm.listings.isEmpty) {
      return const Center(child: Text('Nenhum serviço encontrado'));
    }

    return ListView.builder(
      itemCount: vm.listings.length,
      itemBuilder: (final context, final index) {
        final listing = vm.listings[index];

        return WorkListingEntry(listing: listing);
      },
    );
  }
}