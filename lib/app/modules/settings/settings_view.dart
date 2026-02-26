import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

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
          '⚙️ Configuración',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Apariencia
          _SectionTitle(title: '🎨 Apariencia'),
          Obx(() => _SettingsTile(
            icon: Icons.dark_mode,
            color: Colors.purple,
            title: 'Modo Oscuro',
            subtitle: controller.isDarkMode.value ? 'Activado' : 'Desactivado',
            trailing: Switch(
              value: controller.isDarkMode.value,
              onChanged: (_) => controller.toggleDarkMode(),
              activeColor: Colors.amber,
            ),
          )),
          const SizedBox(height: 20),

          // Notificaciones
          _SectionTitle(title: '🔔 Notificaciones'),
          Obx(() => _SettingsTile(
            icon: Icons.notifications,
            color: Colors.orange,
            title: 'Notificaciones',
            subtitle: controller.notificationsEnabled.value
                ? 'Activadas'
                : 'Desactivadas',
            trailing: Switch(
              value: controller.notificationsEnabled.value,
              onChanged: (_) => controller.toggleNotifications(),
              activeColor: Colors.amber,
            ),
          )),
          Obx(() => _SettingsTile(
            icon: Icons.play_circle,
            color: Colors.blue,
            title: 'Autoplay',
            subtitle: controller.autoplay.value ? 'Activado' : 'Desactivado',
            trailing: Switch(
              value: controller.autoplay.value,
              onChanged: (_) => controller.toggleAutoplay(),
              activeColor: Colors.amber,
            ),
          )),
          const SizedBox(height: 20),

          // Idioma
          _SectionTitle(title: '🌍 Idioma'),
          Obx(() => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecciona idioma',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: controller.languages.map((lang) {
                    final isSelected = controller.selectedLanguage.value == lang;
                    return GestureDetector(
                      onTap: () => controller.changeLanguage(lang),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.amber
                              : const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          lang,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white70,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )),
          const SizedBox(height: 20),

          // Almacenamiento
          _SectionTitle(title: '💾 Almacenamiento'),
          _SettingsTile(
            icon: Icons.delete_outline,
            color: Colors.red,
            title: 'Limpiar Caché',
            subtitle: 'Libera espacio en tu dispositivo',
            trailing: const Icon(Icons.arrow_forward_ios,
                color: Colors.grey, size: 14),
            onTap: controller.clearCache,
          ),
          const SizedBox(height: 20),

          // Acerca de
          _SectionTitle(title: 'ℹ️ Acerca de'),
          _SettingsTile(
            icon: Icons.info_outline,
            color: Colors.teal,
            title: 'Versión',
            subtitle: '1.0.0 — CineGetX Pro',
            trailing: const SizedBox(),
          ),
          _SettingsTile(
            icon: Icons.code,
            color: Colors.green,
            title: 'Desarrollado con',
            subtitle: 'Flutter + GetX 💙',
            trailing: const SizedBox(),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Text(subtitle,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}