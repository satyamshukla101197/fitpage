import 'dart:io';

import 'package:fitpage/utiles/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../api_provider/api_provider.dart';
import '../models/fit_page_list_model.dart';

class FitpageController extends GetxController{

  Rx  title = 'My Awesome View'.obs;
  var fitPageListModel = <FitPageListModel>[].obs;

  @override
  void onInit() async{
    /// Here I am calling api to get response
   await _getData();
    super.onInit();
  }


  /// Get Api
  _getData() async {
    try {
      List<FitPageListModel> jsonResponse = await ApiProvider.base().getFitPageList();

      if(jsonResponse.isNotEmpty){
        /// Here I am string data in model
        fitPageListModel.assignAll(jsonResponse);
      }
    } on HttpException catch (exception) {
      debugPrint(exception.message);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }



  navigationToNextPage({required int index}){
    Get.toNamed(AppRoutes.fitPageDetailsScreen,arguments:[{'criteria':fitPageListModel[index].criteria},{'name':fitPageListModel[index].name},{'tag':fitPageListModel[index].tag},{'color':fitPageListModel[index].color}] );
  }


}