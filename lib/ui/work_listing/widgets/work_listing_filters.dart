import 'package:flutter/material.dart';

import '../../../models/work_category.dart';

class WorkListingFilters extends StatelessWidget {
  final List<WorkCategory> categories;
  final WorkCategory? selectedCategory;
  final ValueChanged<WorkCategory?> onCategoryChanged;

  const WorkListingFilters({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<WorkCategory>(
              initialValue: selectedCategory,
              hint: const Text('Selecione a categoria do serviço'),
              items: categories
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    ),
                  )
                  .toList(),
              onChanged: onCategoryChanged,
            ),
          ),
        ],
      ),
    );
  }
}
