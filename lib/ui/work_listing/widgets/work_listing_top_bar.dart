import '../../work_listing/view_models/work_listing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkListingTopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;

  const WorkListingTopBar({super.key, this.onMenuTap, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WorkListingViewModel>();

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color.fromRGBO(235, 236, 237, 1),
      child: Row(
        children: [
          // HOME
          IconButton(
            iconSize: 32,
            icon: const Icon(Icons.house_rounded),
            style: ButtonStyle(
              iconColor: WidgetStateProperty.resolveWith<Color>(
                (states) => states.contains(WidgetState.hovered)
                    ? Colors.blue
                    : const Color.fromARGB(255, 171, 186, 255),
              ),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: () async {
              await viewModel.loadBackHome();
            },
          ),

          const Spacer(),

          // SEARCH INPUT (condicional)
          if (viewModel.isSearching)
            SizedBox(
              width: 580,
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Buscar serviço...',
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(171, 186, 255, 1),
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: viewModel.updateSearchTerm,
                onSubmitted: (value) => viewModel.search(value),
              ),
            ),

          // LOGO
          if (!viewModel.isSearching)
            SizedBox(
              height: 32,
              child: Image.asset('lib/assets/logo.png', fit: BoxFit.contain),
            ),

          const Spacer(),

          // SEARCH BUTTON
          IconButton(
            iconSize: 32,
            icon: Icon(viewModel.isSearching ? Icons.close : Icons.search),
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              iconColor: WidgetStateProperty.resolveWith<Color>(
                (states) => states.contains(WidgetState.hovered)
                    ? Colors.blue
                    : const Color.fromARGB(255, 171, 186, 255),
              ),
            ),
            onPressed: viewModel.toggleSearch,
          ),
        ],
      ),
    );
  }
}
