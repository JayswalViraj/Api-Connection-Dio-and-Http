import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_api/global_data/constant_data.dart';
import 'package:dio_api/models/posts.dart';
import 'package:dio_api/models/satrt_object_model.dart';
import 'package:dio_api/models/usersmodel.dart';
import 'package:dio_api/screens/api_error_page.dart';
import 'package:dio_api/screens/start_object_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  
  static List<Posts>? postsData ;
 
  static Future<List<Posts>?> callPostsApi() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return postsFromJson(json.toString());
    }
  }


   static List<UsersModel>? usersData ;
 
  static Future<List<UsersModel>?> callUsersApi() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return usersModelFromJson(json);
    }
  }



  
   static StartObjectModel? usersModel ;
 
  static Future<StartObjectModel?> callStartObjectApi() async {
    var client = http.Client();
    var uri = Uri.parse("https://reqres.in/api/users/2");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;

      return startObjectModelFromJson(json);
    }
  }







}
