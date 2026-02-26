import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final isDarkMode = true.obs;
  final notificationsEnabled = true.obs;
  final selectedLanguage = 'Español'.obs;
  final autoplay = false.obs;

  final languages = ['Español', 'English', 'Français', 'Português'];

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(
      isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
    );
  }

  void toggleNotifications() {
    notificationsEnabled.value = !notificationsEnabled.value;
    Get.snackbar(
      notificationsEnabled.value ? '🔔 Notificaciones activadas' : '🔕 Notificaciones desactivadas',
      notificationsEnabled.value
          ? 'Recibirás alertas de estrenos'
          : 'No recibirás más alertas',
      backgroundColor: notificationsEnabled.value
          ? Colors.green.withValues(alpha: 0.8)
          : Colors.red.withValues(alpha: 0.8),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void toggleAutoplay() => autoplay.value = !autoplay.value;

  void changeLanguage(String lang) {
    selectedLanguage.value = lang;
    Get.snackbar(
      '🌍 Idioma cambiado',
      'Idioma: $lang',
      backgroundColor: Colors.blue.withValues(alpha: 0.8),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void clearCache() {
    Get.snackbar(
      '🗑️ Caché limpiado',
      'Se liberó espacio correctamente',
      backgroundColor: Colors.orange.withValues(alpha: 0.8),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}