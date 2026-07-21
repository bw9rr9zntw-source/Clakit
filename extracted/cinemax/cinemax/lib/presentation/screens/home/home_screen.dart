import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:animate_do/animate_do.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/horizontal_movie_list.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repositories/movie_repository.dart';
import '../../providers/app_provider.dart';
import '../movie_detail/movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController();
  int _selectedCategory = 0;

  final List<Movie> _featured = MovieRepository.getFeaturedMovies();
  final List<Movie> _newReleases = MovieRepository.getNewReleases();
  final List<Movie> _mostWatched = MovieRepository.getMostWatched();
  final List<Movie> _continueWatching = MovieRepository.getContinueWatching();

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppProvider>().isDark(context);
    final categories = AppStrings.categories;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isDark),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Banner ─────────────────────────────────────────────────
            _HeroBanner(
              movies: _featured,
              controller: _bannerController,
            ),

            const SizedBox(height: AppSpacing.lg),

            // ── Category Chips ───────────────────────────────────────────────
            FadeInUp(
              duration: const Duration(milliseconds: 400),
              child: _CategoryChips(
                categories: categories,
                selected: _selectedCategory,
                onSelect: (i) => setState(() => _selectedCategory = i),
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // ── Continue Watching ────────────────────────────────────────────
            if (_continueWatching.isNotEmpty)
              FadeInUp(
                duration: const Duration(milliseconds: 450),
                child: HorizontalMovieList(
                  title: 'Continue Watching',
                  movies: _continueWatching,
                  showProgress: true,
                ),
              ),

            // ── New Releases ─────────────────────────────────────────────────
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: HorizontalMovieList(
                title: 'New Releases',
                movies: _newReleases,
                onSeeAll: () {},
              ),
            ),

            // ── Most Watched ─────────────────────────────────────────────────
            FadeInUp(
              duration: const Duration(milliseconds: 550),
              child: HorizontalMovieList(
                title: 'Most Watched',
                movies: _mostWatched,
                onSeeAll: () {},
              ),
            ),

            // ── Recently Added (filtered by selected category) ────────────────
            FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: HorizontalMovieList(
                title: 'Recently Added',
                movies: MovieRepository.getByCategory(
                    categories[_selectedCategory]),
                onSeeAll: () {},
              ),
            ),

            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'CINE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            'MAX',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: isDark ? Colors.white : AppColors.textDark,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            color: isDark ? Colors.white : AppColors.textDark,
          ),
          onPressed: () => context.read<AppProvider>().toggleTheme(),
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: isDark ? Colors.white : AppColors.textDark,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}

// ─── Hero Banner ──────────────────────────────────────────────────────────────

class _HeroBanner extends StatefulWidget {
  final List<Movie> movies;
  final PageController controller;

  const _HeroBanner({required this.movies, required this.controller});

  @override
  State<_HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<_HeroBanner> {
  @override
  Widget build(BuildContext context) {
    final bannerHeight = Responsive.bannerHeight(context);

    return SizedBox(
      height: bannerHeight,
      child: Stack(
        children: [
          // Page View
          PageView.builder(
            controller: widget.controller,
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return _BannerItem(movie: movie);
            },
          ),

          // Dot indicator
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: widget.controller,
                count: widget.movies.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.primary,
                  dotColor: Colors.white38,
                  dotHeight: 6,
                  dotWidth: 6,
                  expansionFactor: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final Movie movie;
  const _BannerItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Backdrop image
          Image.network(
            movie.backdropUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: AppColors.darkCard,
              child: const Icon(Icons.movie, size: 80, color: Colors.white24),
            ),
          ),

          // Gradient overlay
          const DecoratedBox(
            decoration: BoxDecoration(gradient: AppColors.cardOverlay),
          ),

          // Content
          Positioned(
            bottom: 48,
            left: AppSpacing.md,
            right: AppSpacing.md,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Genre tag
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    movie.genre.split('/').first.trim().toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          const Shadow(
                            color: Colors.black54,
                            blurRadius: 8,
                          )
                        ],
                      ),
                ),
                const SizedBox(height: 8),

                // Meta row
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: AppColors.accent, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      movie.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      movie.year,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      movie.duration,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13),
                    ),
                    const Spacer(),

                    // Watch Now button
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MovieDetailScreen(movie: movie)),
                      ),
                      icon: const Icon(Icons.play_arrow_rounded, size: 18),
                      label: const Text('Watch'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Category Chips ───────────────────────────────────────────────────────────

class _CategoryChips extends StatelessWidget {
  final List<String> categories;
  final int selected;
  final ValueChanged<int> onSelect;

  const _CategoryChips({
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = selected == index;
          return GestureDetector(
            onTap: () => onSelect(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color:
                      isSelected ? AppColors.primary : Colors.white24,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white60,
                  fontSize: 13,
                  fontWeight: isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
