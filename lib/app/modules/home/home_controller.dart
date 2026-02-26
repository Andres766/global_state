import 'package:get/get.dart';
import '../../data/movie_data.dart';
import '../../models/movie_model.dart';

class HomeController extends GetxController {
  final movies = <Movie>[].obs;
  final categories = <String>[].obs;
  final featuredMovie = Rx<Movie?>(null);
  final currentBannerIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    movies.assignAll(MovieData.movies);
    categories.assignAll(MovieData.categories);
    featuredMovie.value = MovieData.movies.first;
    _startBannerTimer();
  }

  void _startBannerTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      if (currentBannerIndex.value < 2) {
        currentBannerIndex.value++;
      } else {
        currentBannerIndex.value = 0;
      }
      _startBannerTimer();
    });
  }

  List<Movie> get bannerMovies => movies.take(3).toList();

  List<Movie> moviesByCategory(String category) =>
      movies.where((m) => m.category == category).toList();
}