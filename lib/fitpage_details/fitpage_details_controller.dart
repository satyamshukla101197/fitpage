import 'package:get/get.dart';

class FitPageDetailsController extends GetxController{

  Rx  title = 'My Awesome View'.obs;
  var criteria=[].obs;
  Rx name="".obs;
  Rx tag="".obs;
  Rx color="".obs;



  @override
  void onInit() {
    /// Collecting data from argument
    name.value=Get.arguments[1]['name'];
    tag.value=Get.arguments[2]['tag'];
    color.value=Get.arguments[3]['color'];
    criteria.value.assignAll(Get.arguments[0]['criteria']);
    super.onInit();
  }
}