
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/fit_page_list_model.dart';
import 'fitpage_controller.dart';

class FitPageScreen extends GetView<FitpageController>{

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: const Color(0xff01131b),
       appBar: AppBar(
         automaticallyImplyLeading: false,
         elevation: 0.0,
         backgroundColor:const Color(0xff01131b),
       ),
       body: Obx(() =>ListView.separated(
         padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
         shrinkWrap: true,
         separatorBuilder: (BuildContext context, int index){
           return const Divider(thickness: 2,color: Colors.white,);
         },
         itemCount: controller.fitPageListModel.length,
         itemBuilder: (BuildContext context,int index){
           return GestureDetector(
             onTap: (){
               controller.navigationToNextPage(index: index);
             },
             child: Container(
               child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   const SizedBox(height: 10,),
                   Text(controller.fitPageListModel[index].name??"",
                       style:  const TextStyle(color: Colors.white,fontSize: 18 )),
                   Text(controller.fitPageListModel[index].tag??"",style:  TextStyle(color: controller.fitPageListModel[index].color=='green'?Colors.green: controller.fitPageListModel[index].color=='red'?Colors.red:Colors.black,fontSize: 12),),
                  const SizedBox(height: 10,)
                 ],
               ),
             ),
           );
         },
       )),
     ),
   );
  }

}