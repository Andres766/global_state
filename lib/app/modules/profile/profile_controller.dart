import 'package:get/get.dart';
import '../../data/movie_data.dart';

class ProfileController extends GetxController {
  final userName = 'Cinéfilo Pro'.obs;
  final userEmail = 'cinefilo@cinegetx.com'.obs;
  final userEmoji = '🎬'.obs;

  int get totalMovies => MovieData.movies.length;
  int get totalCategories => MovieData.categories.length;

  final recentActivity = <Map<String, String>>[
    {'action': '❤️ Agregó a favoritos', 'movie': 'El Origen'},
    {'action': '⭐ Reseñó', 'movie': 'Interestelar'},
    {'action': '👁️ Vio', 'movie': 'El Padrino'},
    {'action': '❤️ Agregó a favoritos', 'movie': 'Joker'},
    {'action': '⭐ Reseñó', 'movie': 'Coco'},
  ].obs;

  void updateName(String name) {
    if (name.trim().isNotEmpty) userName.value = name;
  }
}