import 'package:get/get.dart';
import '../../models/movie_model.dart';

class FavoritesController extends GetxController {
  final favorites = <Movie>[].obs;

  void toggleFavorite(Movie movie) {
    if (isFavorite(movie)) {
      favorites.removeWhere((m) => m.id == movie.id);
      movie.isFavorite = false;
    } else {
      movie.isFavorite = true;
      favorites.add(movie);
    }
  }

  bool isFavorite(Movie movie) {
    return favorites.any((m) => m.id == movie.id);
  }

  int get totalFavorites => favorites.length;
}