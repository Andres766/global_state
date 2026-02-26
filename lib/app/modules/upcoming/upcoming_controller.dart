import 'package:get/get.dart';
import '../../models/movie_model.dart';
import '../../data/movie_data.dart';

class UpcomingController extends GetxController {
  final movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    movies.assignAll(MovieData.upcomingMovies);
  }
}