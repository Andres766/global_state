import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Obx(() => Text(
          controller.selectedCategory.value,
          style: const TextStyle(color: Colors.amber),
        )),
      ),
      body: Obx(() => controller.filteredMovies.isEmpty
          ? const Center(
              child: Text('Sin películas',
                  style: TextStyle(color: Colors.white)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: controller.filteredMovies.length,
              itemBuilder: (_, i) {
                final movie = controller.filteredMovies[i];
                return ListTile(
                  leading: Text(movie.emoji,
                      style: const TextStyle(fontSize: 32)),
                  title: Text(movie.title,
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      Text(' ${movie.rating}',
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.grey, size: 14),
                  onTap: () => Get.toNamed(AppRoutes.detail, arguments: movie),
                );
              },
            )),
    );
  }
}