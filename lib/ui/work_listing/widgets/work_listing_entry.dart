import 'package:flutter/material.dart';
import '../../../models/work_listing.dart';

class WorkListingEntry extends StatelessWidget {
  final WorkListing listing;

  const WorkListingEntry({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final pictureUrl = listing.professional?.pictureUrl;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color.fromRGBO(247, 242, 250, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: const Color.fromRGBO(235, 236, 237, 1),
              child: ClipOval(
                child: (pictureUrl != null && pictureUrl.isNotEmpty)
                    ? Image.network(
                        pictureUrl,
                        width: 84,
                        height: 84,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // fallback: ícone padrão
                          return const Icon(
                            Icons.person,
                            size: 48,
                            color: Colors.grey,
                          );
                        },
                      )
                    : const Icon(Icons.person, size: 48, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 24),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.professional?.name ?? 'Não disponível',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D6EBD),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: listing.category?.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Faço '),
                        TextSpan(
                          text: listing.type?.name.toLowerCase() ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text(listing.description),

                  const SizedBox(height: 8),
                  Text(
                    'Valor estimado: R\$ ${listing.estimatedPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
