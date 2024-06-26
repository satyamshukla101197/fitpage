import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'fitpage_details_controller.dart';

class FitPageDetails extends GetView<FitPageDetailsController>{
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
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: context.width,
                color:const Color(0xff1686b0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10,),
                    Text(controller.name.value??"",
                        style:  const TextStyle(color: Colors.white,fontSize: 18 )),
                    Text(controller.tag.value??"",style:  TextStyle(color: controller.color.value=='green'?Colors.green: controller.color.value=='red'?Colors.red:Colors.black,fontSize: 12),),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: (BuildContext context,int index){
                    return Container(
                      padding: const EdgeInsets.only(top: 10,bottom: 20),
                      child: const Text('and',
                          style:  TextStyle(color: Colors.white,fontSize: 12 )),
                    );
                  },
                  itemCount: controller.criteria.length,
                itemBuilder: (BuildContext context,int index){
                    return Container(
                      child: Text(controller.criteria[index].text??"",
                          style:  const TextStyle(color: Colors.white,fontSize: 18 )),
                    );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}