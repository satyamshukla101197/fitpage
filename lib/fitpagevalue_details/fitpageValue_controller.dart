import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FitpageValueController extends GetxController{

  var criteriaValueData=[].obs;
  Rx studyType=''.obs;
  Rx dataType=''.obs;
  Rx parameterName=''.obs;
  Rx minValue=''.obs;
  Rx maxValue=''.obs;
  Rx defaultValue=''.obs;
  var textController=TextEditingController().obs;
  @override
  void onInit() {

    print("99999999999");
    print(Get.arguments[0]['type']);

    if(Get.arguments[0]['type']=="indicator"){
      studyType.value=Get.arguments[0]['listValueData'][1]['study_type'].toString();
      dataType.value=Get.arguments[0]['listValueData'][0]['type'].toString();
      parameterName.value=Get.arguments[0]['listValueData'][2]['parameter_name'].toString();
      minValue.value=Get.arguments[0]['listValueData'][3]['min_value'].toString();
      maxValue.value=Get.arguments[0]['listValueData'][4]['max_value'].toString();
      defaultValue.value=Get.arguments[0]['listValueData'][5]['default_value'].toString();
      if(dataType.value!=null){
        textController.value.text=defaultValue.value;
      }
    }else{
      criteriaValueData.value.assignAll(Get.arguments[0]['listValueData']);
    }

    super.onInit();
  }
}