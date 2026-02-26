import 'package:get/get.dart';
import '../../models/movie_model.dart';
import '../../data/movie_data.dart';

class SearchController extends GetxController {
  final searchQuery = ''.obs;
  final results = <Movie>[].obs;
  final isSearching = false.obs;

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      results.clear();
      isSearching.value = false;
      return;
    }
    isSearching.value = true;
    results.assignAll(
      MovieData.movies.where(
        (m) =>
            m.title.toLowerCase().contains(query.toLowerCase()) ||
            m.category.toLowerCase().contains(query.toLowerCase()) ||
            m.cast.any((c) => c.toLowerCase().contains(query.toLowerCase())),
      ),
    );
  }

  void clearSearch() {
    searchQuery.value = '';
    results.clear();
    isSearching.value = false;
  }
}