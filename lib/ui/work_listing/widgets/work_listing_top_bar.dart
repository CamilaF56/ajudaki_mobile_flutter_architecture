import 'package:ajudaki_mobile_flutter_architecture/ui/work_listing/view_models/work_listing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkListingTopBar extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;

  const WorkListingTopBar({super.key, this.onMenuTap, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color.fromARGB(255, 82, 145, 197),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.house_rounded, color: Colors.white),
            onPressed: () async {
              final viewModel = context.read<WorkListingViewModel>();
              await viewModel.laodBackHome();
            },
          ),

          const Spacer(),
          SizedBox(
            height: 52,
            child: Image.asset('lib/assets/logo.png', fit: BoxFit.contain),
          ),

          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: onSearchTap,
          ),
        ],
      ),
    );
  }
}
