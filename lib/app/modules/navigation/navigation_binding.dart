import 'package:get/get.dart';
import 'navigation_controller.dart';
import '../home/home_controller.dart';
import '../favorites/favorites_controller.dart';
import '../search/search_controller.dart' as sc;
import '../profile/profile_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<sc.SearchController>(() => sc.SearchController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}