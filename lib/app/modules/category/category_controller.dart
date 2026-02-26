import 'package:get/get.dart';
import '../../data/movie_data.dart';
import '../../models/movie_model.dart';

class CategoryController extends GetxController {
  final filteredMovies = <Movie>[].obs;
  final selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedCategory.value = Get.arguments as String;
    filteredMovies.assignAll(
      MovieData.movies.where((m) => m.category == selectedCategory.value),
    );
  }
}