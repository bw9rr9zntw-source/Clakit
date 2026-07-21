import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/movie_model.dart';
import '../../presentation/screens/movie_detail/movie_detail_screen.dart';

/// Vertical movie card for grid and horizontal lists
class MovieCard extends StatelessWidget {
  final Movie movie;
  final double? width;
  final double? height;
  final bool showProgress;

  const MovieCard({
    super.key,
    required this.movie,
    this.width,
    this.height,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = width ?? 130.0;
    final cardHeight = height ?? 195.0;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MovieDetailScreen(movie: movie),
        ),
      ),
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Poster ────────────────────────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: Stack(
                children: [
                  _PosterImage(
                    url: movie.posterUrl,
                    width: cardWidth,
                    height: cardHeight,
                  ),

                  // Rating badge
                  Positioned(
                    top: 8,
                    right: 8,
                    child: _RatingBadge(rating: movie.rating),
                  ),

                  // New badge
                  if (movie.isNew)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                  // Watch progress bar
                  if (showProgress && movie.watchProgress != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: movie.watchProgress,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                            minHeight: 3,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── Title ─────────────────────────────────────────────────────────
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              '${movie.year} • ${movie.genre.split('/').first.trim()}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _PosterImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const _PosterImage(
      {required this.url, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: AppColors.darkCard,
        child: const Icon(Icons.movie_outlined,
            color: AppColors.textSecondary, size: 40),
      ),
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return Container(
          width: width,
          height: height,
          color: AppColors.darkCard,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: AppColors.accent, size: 11),
          const SizedBox(width: 2),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
