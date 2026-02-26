import 'package:get/get.dart';
import 'toprated_controller.dart';

class TopratedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopratedController>(() => TopratedController());
  }
}