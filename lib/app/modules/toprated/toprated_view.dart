import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'toprated_controller.dart';
import '../../routes/app_routes.dart';

class TopratedView extends GetView<TopratedController> {
  const TopratedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          '🏆 Top Rated',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.movies.length,
        itemBuilder: (_, i) {
          final movie = controller.movies[i];
          final medals = ['🥇', '🥈', '🥉'];
          final badge = i < 3 ? medals[i] : '${i + 1}';
          return GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.detail, arguments: movie),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: i == 0
                      ? [const Color(0xFF3A2A00), const Color(0xFF1E1E1E)]
                      : i == 1
                          ? [const Color(0xFF2A2A2A), const Color(0xFF1E1E1E)]
                          : i == 2
                              ? [const Color(0xFF2A1A0A), const Color(0xFF1E1E1E)]
                              : [const Color(0xFF1E1E1E), const Color(0xFF1A1A1A)],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: i == 0
                        ? Colors.amber.withValues(alpha: 0.2)
                        : Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text(
                      badge,
                      style: TextStyle(
                        fontSize: i < 3 ? 28 : 18,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(movie.emoji, style: const TextStyle(fontSize: 44)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          movie.category,
                          style: const TextStyle(
                              color: Colors.amber, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amber.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.amber, size: 14),
                        Text(
                          ' ${movie.rating}',
                          style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}