import 'package:flutter/material.dart';

/// View responsável por exibir um ranqueamento em formato de estrelas.
/// Recebe um 'rating' (nota) de 0 a 5.
class RankingStarsView extends StatelessWidget {
  final double rating;

  const RankingStarsView({super.key, required this.rating})
    : assert(
        rating >= 0.0 && rating <= 5.0,
        'Rating must be between 0.0 and 5.0',
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          // Estrela totalmente preenchida
          return const Icon(Icons.star, color: Colors.amber, size: 24);
        } else if (index < rating && rating < (index + 1)) {
          // Meia estrela (se o rating for decimal)
          return const Icon(Icons.star_half, color: Colors.amber, size: 24);
        } else {
          // Estrela vazia (borda)
          return const Icon(Icons.star_border, color: Colors.amber, size: 24);
        }
      }),
    );
  }
}
