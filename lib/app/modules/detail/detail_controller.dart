import 'package:get/get.dart';
import '../../models/movie_model.dart';

class DetailController extends GetxController {
  late Movie movie;

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments as Movie;
  }
}