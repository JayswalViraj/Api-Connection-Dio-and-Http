import 'package:dio/dio.dart';
import 'package:dio_api/global_data/constant_data.dart';
import 'package:dio_api/models/posts.dart';
import 'package:dio_api/screens/api_error_page.dart';
import 'package:flutter/material.dart';

class ApiServices {
  static BuildContext? apiContext;
  static Posts? postsData;
  static Future<Posts?> getPost({BuildContext? context}) async {
    apiContext = context;

    try {
      Response postsData = await Dio().get(baseUrl + 'post');
      debugPrint('STATUS: ${postsData.statusCode}');
      if (postsData.statusCode == 200) {
        debugPrint('User Info: ${postsData.data}');
        postsData = postsFromJson(postsData.data) as Response;
      } else {
        Navigator.of(apiContext!)
            .push(MaterialPageRoute(builder: (apiContext) => ApiErrorPage()));
      }
    } on DioError catch (e) {
 
      if (e.response != null) {
        Navigator.of(apiContext!)
            .push(MaterialPageRoute(builder: (apiContext) => ApiErrorPage()));
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        Navigator.of(apiContext!)
            .push(MaterialPageRoute(builder: (apiContext) => ApiErrorPage()));

        // Error due to setting up or sending the request
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    }
    return postsData;
  }
}
