import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/movie_model.dart';
import '../../data/movie_data.dart';

class ReviewsController extends GetxController {
  late Movie movie;
  final reviews = <Review>[].obs;
  final commentInput = ''.obs;
  final ratingInput = 5.0.obs;

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments as Movie;
    final existing = MovieData.reviews[movie.id];
    if (existing != null) reviews.assignAll(existing);
  }

  void addReview() {
    if (commentInput.value.trim().isEmpty) return;
    reviews.add(Review(
      author: 'Tú',
      comment: commentInput.value,
      rating: ratingInput.value,
      date: 'Hoy',
    ));
    commentInput.value = '';
    ratingInput.value = 5.0;
    Get.snackbar(
      '✅ Reseña agregada',
      'Gracias por tu opinión',
      backgroundColor: Colors.green.withValues(alpha: 0.8),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  double get averageRating {
    if (reviews.isEmpty) return 0.0;
    return reviews.map((r) => r.rating).reduce((a, b) => a + b) /
        reviews.length;
  }
}