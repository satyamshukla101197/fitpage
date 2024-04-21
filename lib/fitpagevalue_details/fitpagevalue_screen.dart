

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'fitpageValue_controller.dart';

class FitpageValueScreen extends GetView<FitpageValueController>{
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
        body: controller.dataType.value=="indicator"?_showIndeicatorTypeWidget():ListView.separated(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index){
            return const Divider(thickness: 2,color: Colors.white,);
          },
            itemCount: controller.criteriaValueData.value.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              child: Text(controller.criteriaValueData[index].toString()??"",style:  const TextStyle(color: Colors.white,fontSize: 18 ))
            );
          },
        ),
      ),
    );
  }

 Widget _showIndeicatorTypeWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(controller.studyType.toString().toUpperCase()??"",style:  const TextStyle(color: Colors.white,fontSize: 24 ,fontWeight: FontWeight.w500)),
          SizedBox(height: 20,),
          Text("Set Parameters"??"",style:  const TextStyle(color: Colors.white,fontSize: 18 ,fontWeight: FontWeight.w300)),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(controller.parameterName.value.toString().toUpperCase()??"",style:  const TextStyle(color: Colors.black,fontSize: 16 ,fontWeight: FontWeight.w300)),
                SizedBox(width: 20,),
                Flexible(
                  child: SizedBox(
                    height: 30,
                    child: TextFormField(

                      controller: controller.textController.value,
                      maxLength: int.parse(controller.maxValue.value),
                      decoration: InputDecoration(
                        counterText: '',
                        //labelText: controller.defaultValue.value.toString(),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
 }
  
}