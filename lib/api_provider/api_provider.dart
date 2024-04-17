import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../models/fit_page_list_model.dart';
import 'DioLogger.dart';
import 'api_constants.dart';

class ApiProvider {
  Dio _dio = Dio();
  DioError? _dioError;

  ApiProvider.base() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {

      options.headers = {'Content-Type': 'application/json','X-localization': 'en'};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      return handler.next(error);
    }));
  }







  Future<List<FitPageListModel>> getFitPageList() async {
    try {
      Response response = await _dio.get('data.json');
      List<dynamic> jsonData = response.data;
      return jsonData.map((json) => FitPageListModel.fromJson(json)).toList();
    } catch (error, stacktrace) {
      return handleException(error, stacktrace, _dioError!);
    }
  }




}
