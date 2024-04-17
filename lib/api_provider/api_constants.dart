import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


String tag = 'api_provider';

const baseUrl = 'http://coding-assignment.bombayrunning.com/';





handleException(error,stacktrace,DioError dioError){
  debugPrint("Exception occurred: $error stackTrace: $stacktrace");
  if (dioError.response!.statusCode == 401) {
    throwIfNoSuccess("unauthorized".tr);
  } else if (dioError.response!.statusCode == 500) {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("server_error".tr);
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  } else {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("something_went_wrong".tr);
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  }
}

void throwIfNoSuccess(String response) {
  throw HttpException(response);
}