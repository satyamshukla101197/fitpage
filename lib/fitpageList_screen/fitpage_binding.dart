import 'package:get/get.dart';
import 'fitpage_controller.dart';

class FitpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FitpageController());
  }
}
