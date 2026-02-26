import 'package:get/get.dart';
import '../../models/movie_model.dart';
import '../../data/movie_data.dart';

class TopratedController extends GetxController {
  final movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    final sorted = List<Movie>.from(MovieData.movies)
      ..sort((a, b) => b.rating.compareTo(a.rating));
    movies.assignAll(sorted);
  }
}