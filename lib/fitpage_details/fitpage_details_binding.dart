 import 'package:get/get.dart';

import 'fitpage_details_controller.dart';

class FitPageDetailsBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<FitPageDetailsController>(() => FitPageDetailsController());
  }

}