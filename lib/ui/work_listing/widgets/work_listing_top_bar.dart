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
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 64 + statusBarHeight,
      padding: EdgeInsets.fromLTRB(16, statusBarHeight, 16, 0),
      color: const Color.fromRGBO(235, 236, 237, 1),
      child: Row(
        children: [
          // HOME
          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.resolveWith<Color>(
                  (states) => states.contains(WidgetState.hovered)
                      ? Colors.blue
                      : const Color.fromARGB(255, 171, 186, 255),
                ),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
              icon: const Icon(Icons.house_rounded, size: 28),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                if (viewModel.isSearching) {
                  viewModel.toggleSearch();
                }

                await viewModel.loadBackHome();
              },
            ),
          ),

          const SizedBox(width: 12),

          // SEARCH INPUT
          if (viewModel.isSearching)
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Buscar serviço...',
                  isDense: true,
                ),
                onChanged: viewModel.updateSearchTerm,
                onSubmitted: (value) => viewModel.search(value),
              ),
            )
          else
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 32,
                  child: Image.asset('lib/assets/logo.png'),
                ),
              ),
            ),

          const SizedBox(width: 12),

          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.resolveWith<Color>(
                  (states) => states.contains(WidgetState.hovered)
                      ? Colors.blue
                      : const Color.fromARGB(255, 171, 186, 255),
                ),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
              icon: Icon(
                viewModel.isSearching ? Icons.close : Icons.search,
                size: 28,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                viewModel.toggleSearch();
              },
            ),
          ),
        ],
      ),
    );
  }
}
