/// Simple immutable model representing a movie / show.
class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double rating;
  final String year;
  final String duration;
  final String genre;
  final String description;
  final bool isNew;
  final double? watchProgress; // 0.0 - 1.0, null if not started
  final List<String> cast;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.rating,
    required this.year,
    required this.duration,
    required this.genre,
    required this.description,
    this.isNew = false,
    this.watchProgress,
    this.cast = const [],
  });

  Movie copyWith({
    String? id,
    String? title,
    String? posterUrl,
    String? backdropUrl,
    double? rating,
    String? year,
    String? duration,
    String? genre,
    String? description,
    bool? isNew,
    double? watchProgress,
    List<String>? cast,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      rating: rating ?? this.rating,
      year: year ?? this.year,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      isNew: isNew ?? this.isNew,
      watchProgress: watchProgress ?? this.watchProgress,
      cast: cast ?? this.cast,
    );
  }
}
