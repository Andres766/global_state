import 'package:get/get.dart';
import '../modules/splash/splash_view.dart';
import '../modules/navigation/navigation_view.dart';
import '../modules/navigation/navigation_binding.dart';
import '../modules/detail/detail_view.dart';
import '../modules/detail/detail_binding.dart';
import '../modules/category/category_view.dart';
import '../modules/category/category_binding.dart';
import '../modules/reviews/reviews_view.dart';
import '../modules/reviews/reviews_binding.dart';
import '../modules/toprated/toprated_view.dart';
import '../modules/toprated/toprated_binding.dart';
import '../modules/upcoming/upcoming_view.dart';
import '../modules/upcoming/upcoming_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/settings/settings_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.navigation,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutes.category,
      page: () => TopratedView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: AppRoutes.reviews,
      page: () => ReviewsView(),
      binding: ReviewsBinding(),
    ),
    GetPage(
      name: AppRoutes.toprated,
      page: () => const TopratedView(),
      binding: TopratedBinding(),
    ),
    GetPage(
      name: AppRoutes.upcoming,
      page: () => const UpcomingView(),
      binding: UpcomingBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}