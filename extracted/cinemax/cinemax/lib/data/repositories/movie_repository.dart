import '../models/movie_model.dart';

/// In-memory mock data source for the app.
/// In a real app this would be replaced by API / database calls.
class MovieRepository {
  MovieRepository._();

  static final List<Movie> _movies = [
    Movie(
      id: '1',
      title: 'Edge of Tomorrow',
      posterUrl: 'https://picsum.photos/seed/movie1/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie1backdrop/1200/700',
      rating: 8.2,
      year: '2024',
      duration: '2h 8m',
      genre: 'Action/Sci-Fi',
      description:
          'A soldier relives the same day over and over again, the day restarting every time he dies, as he fights an alien invasion that is slowly destroying Earth.',
      isNew: true,
      cast: ['Alex Carter', 'Mia Chen', 'Daniel Frost'],
    ),
    Movie(
      id: '2',
      title: 'Silent Echoes',
      posterUrl: 'https://picsum.photos/seed/movie2/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie2backdrop/1200/700',
      rating: 7.5,
      year: '2023',
      duration: '1h 54m',
      genre: 'Drama/Mystery',
      description:
          'A detective haunted by her past returns to her hometown to investigate a series of disappearances connected to an old family secret.',
      cast: ['Laura Vance', 'Tom Reyes'],
      watchProgress: 0.42,
    ),
    Movie(
      id: '3',
      title: 'Comedy Night',
      posterUrl: 'https://picsum.photos/seed/movie3/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie3backdrop/1200/700',
      rating: 6.9,
      year: '2022',
      duration: '1h 38m',
      genre: 'Comedy',
      description:
          'Four friends decide to host an open-mic comedy night that spirals into chaos when an uninvited guest steals the spotlight.',
      cast: ['Jamie Lin', 'Marcus Cole', 'Priya Anand'],
    ),
    Movie(
      id: '4',
      title: 'Beyond the Stars',
      posterUrl: 'https://picsum.photos/seed/movie4/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie4backdrop/1200/700',
      rating: 9.0,
      year: '2024',
      duration: '2h 31m',
      genre: 'Sci-Fi/Adventure',
      description:
          'A crew of explorers travels beyond the edge of known space, only to discover that something has been waiting for them all along.',
      isNew: true,
      cast: ['Nora Black', 'Ethan Wolfe', 'Sofia Reyes'],
    ),
    Movie(
      id: '5',
      title: 'Whispers in the Dark',
      posterUrl: 'https://picsum.photos/seed/movie5/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie5backdrop/1200/700',
      rating: 7.1,
      year: '2021',
      duration: '1h 47m',
      genre: 'Horror',
      description:
          'A family moves into an old countryside house, unaware of the dark presence that has lived within its walls for generations.',
      cast: ['Ivy Monroe', 'Grace Holt'],
      watchProgress: 0.15,
    ),
    Movie(
      id: '6',
      title: 'Hearts Aligned',
      posterUrl: 'https://picsum.photos/seed/movie6/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie6backdrop/1200/700',
      rating: 7.8,
      year: '2023',
      duration: '1h 52m',
      genre: 'Romance/Drama',
      description:
          'Two strangers keep crossing paths in the most unexpected ways, forcing them to wonder if fate is trying to tell them something.',
      cast: ['Olivia Pierce', 'Liam Foster'],
    ),
    Movie(
      id: '7',
      title: 'The Last Stand',
      posterUrl: 'https://picsum.photos/seed/movie7/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie7backdrop/1200/700',
      rating: 8.6,
      year: '2024',
      duration: '2h 15m',
      genre: 'Action/Thriller',
      description:
          'A retired special forces operative is pulled back into action when his town is taken hostage by a ruthless crime syndicate.',
      isNew: true,
      cast: ['Derek Stone', 'Maria Lopez'],
    ),
    Movie(
      id: '8',
      title: 'Color of Dreams',
      posterUrl: 'https://picsum.photos/seed/movie8/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie8backdrop/1200/700',
      rating: 8.0,
      year: '2022',
      duration: '1h 36m',
      genre: 'Animation/Family',
      description:
          'A young artist discovers a magical paintbrush that brings her drawings to life, leading to a colorful adventure beyond imagination.',
      cast: ['Voice of Ella Park', 'Voice of Sam Reed'],
    ),
    Movie(
      id: '9',
      title: 'Midnight Pursuit',
      posterUrl: 'https://picsum.photos/seed/movie9/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie9backdrop/1200/700',
      rating: 7.3,
      year: '2021',
      duration: '1h 58m',
      genre: 'Action/Crime',
      description:
          'A getaway driver gets entangled in a heist gone wrong and must outrun both the police and the crew that betrayed him.',
      cast: ['Victor Cruz', 'Nadia Hale'],
      watchProgress: 0.78,
    ),
    Movie(
      id: '10',
      title: 'The Quiet Garden',
      posterUrl: 'https://picsum.photos/seed/movie10/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie10backdrop/1200/700',
      rating: 8.4,
      year: '2023',
      duration: '1h 49m',
      genre: 'Drama',
      description:
          'After losing her job, a woman finds unexpected purpose restoring an abandoned community garden alongside an eclectic group of neighbors.',
      cast: ['Helen Brooks', 'Marcus Diallo'],
    ),
    Movie(
      id: '11',
      title: 'Static',
      posterUrl: 'https://picsum.photos/seed/movie11/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie11backdrop/1200/700',
      rating: 6.7,
      year: '2020',
      duration: '1h 41m',
      genre: 'Horror/Thriller',
      description:
          'A late-night radio host begins receiving calls from a listener who seems to know things that have not happened yet.',
      cast: ['Renee Faulkner'],
    ),
    Movie(
      id: '12',
      title: 'Skyline Drift',
      posterUrl: 'https://picsum.photos/seed/movie12/400/600',
      backdropUrl: 'https://picsum.photos/seed/movie12backdrop/1200/700',
      rating: 7.9,
      year: '2024',
      duration: '2h 2m',
      genre: 'Action/Sci-Fi',
      description:
          'In a city built on floating platforms, a courier uncovers a conspiracy that threatens to bring the entire skyline crashing down.',
      isNew: true,
      cast: ['Kai Anders', 'Zoe Bennett'],
    ),
  ];

  static List<Movie> getAllMovies() => List.unmodifiable(_movies);

  static List<Movie> getFeaturedMovies() =>
      _movies.where((m) => m.rating >= 8.0).take(5).toList();

  static List<Movie> getNewReleases() =>
      _movies.where((m) => m.isNew).toList();

  static List<Movie> getMostWatched() =>
      (_movies.toList()..sort((a, b) => b.rating.compareTo(a.rating)))
          .take(8)
          .toList();

  static List<Movie> getContinueWatching() =>
      _movies.where((m) => m.watchProgress != null).toList();

  static List<Movie> getByCategory(String category) {
    if (category == 'All') return _movies;
    return _movies
        .where((m) => m.genre.toLowerCase().contains(category.toLowerCase()))
        .toList();
  }

  static List<Movie> search(String query) {
    if (query.trim().isEmpty) return [];
    final lower = query.toLowerCase();
    return _movies
        .where((m) =>
            m.title.toLowerCase().contains(lower) ||
            m.genre.toLowerCase().contains(lower))
        .toList();
  }

  static Movie? getById(String id) {
    try {
      return _movies.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }
}
