import 'dart:convert';

import 'package:fitpage/utiles/app_pages.dart';
import 'package:fitpage/utiles/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/fit_page_list_model.dart';

class FitPageDetailsController extends GetxController{

  Rx  title = 'My Awesome View'.obs;
  var variablesData=Variable().obs;
  var criteria=[].obs;
  Rx name="".obs;
  Rx tag="".obs;
  Rx color="".obs;
  var data=[].obs;
  var dataType="".obs;
  var indicator=[].obs;



  @override
  void onInit() {
    /// Collecting data from argument
    name.value=Get.arguments[1]['name'];
    tag.value=Get.arguments[2]['tag'];
    color.value=Get.arguments[3]['color'];
    criteria.value.assignAll(Get.arguments[0]['criteria']);
    super.onInit();
  }





  navigationNextPage({required int index,required String clickedData}){


    print(clickedData);
    print("000000000");
    print(index);
    data.clear();
    if(clickedData=="1"&&criteria.value[index].variable.the1.type=="indicator"){
      dataType.value=criteria.value[index].variable.the1.type;
      indicator.assignAll([
        {'type':criteria.value[index].variable.the1.type},
        {'study_type':criteria.value[index].variable.the1.studyType},
        {'parameter_name':criteria.value[index].variable.the1.parameterName},
        {'min_value':criteria.value[index].variable.the1.minValue},
        {'max_value':criteria.value[index].variable.the1.maxValue},
        {'default_value':criteria.value[index].variable.the1.defaultValue},
      ]);
    }else if(clickedData=="1"){
        dataType.value=criteria.value[index].variable.the1.type;
        data.assignAll(criteria.value[index].variable.the1.values);
      } else if(clickedData=="2"){
        dataType.value=criteria.value[index].variable.the2.type;
        data.assignAll(criteria.value[index].variable.the2.values);
      }else if(clickedData=="3"){
        dataType.value=criteria.value[index].variable.the3.type;
        data.assignAll(criteria.value[index].variable.the3.values);
      }else{
        dataType.value=criteria.value[index].variable.the4.type;
        indicator.assignAll([
          {'type':criteria.value[index].variable.the4.type},
          {'study_type':criteria.value[index].variable.the4.studyType},
          {'parameter_name':criteria.value[index].variable.the4.parameterName},
          {'min_value':criteria.value[index].variable.the4.minValue},
          {'max_value':criteria.value[index].variable.the4.maxValue},
          {'default_value':criteria.value[index].variable.the4.defaultValue},
        ]);

      }



    Get.offAllNamed(AppRoutes.fitPageValueDetailsScreen,arguments: [{'type':dataType,'listValueData':dataType=="indicator"?indicator.value:data.value}]);
  }

}