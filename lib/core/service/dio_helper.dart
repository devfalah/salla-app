import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url,
      required Map<String, dynamic>? query,
      String lang = 'en',
      String token = ''}) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, dynamic> query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio!
        .post(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((onError) {
      print("error   " + onError.toString());
    });
  }
}
