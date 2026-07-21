import 'package:flutter/material.dart';
import '../../data/models/movie_model.dart';

/// App-wide state: theme mode + a simple in-memory "my list" of movies.
class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  final List<Movie> _myList = [];

  ThemeMode get themeMode => _themeMode;
  List<Movie> get myList => List.unmodifiable(_myList);

  /// Resolves whether the effective theme is dark, taking system
  /// brightness into account when the mode is set to [ThemeMode.system].
  bool isDark(BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  bool isInMyList(String movieId) =>
      _myList.any((m) => m.id == movieId);

  void toggleMyList(Movie movie) {
    if (isInMyList(movie.id)) {
      _myList.removeWhere((m) => m.id == movie.id);
    } else {
      _myList.add(movie);
    }
    notifyListeners();
  }
}
