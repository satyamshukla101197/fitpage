import 'package:get/get.dart';

import 'fitpageValue_controller.dart';
class FitpageValueBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FitpageValueController>(() => FitpageValueController());
  }

}