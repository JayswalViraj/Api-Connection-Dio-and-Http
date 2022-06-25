import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_api/models2/array_api.dart';
import 'package:dio_api/models2/object_api.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  static httpMethodStartObject() async {
    var url = Uri.parse('https://reqres.in/api/users/2');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');

      var apiVal = jsonDecode(response.body);

   
    ObjectApi objectApi= ObjectApi.fromJson(apiVal);

      //print('Data in id: ' + apiVal["data"]["id"].toString());
      print('print with model Data in id: ' + objectApi.data!.toString() );
    }
  }


  static List<ArrayApi>  httparrayListApiName=[];
    static httpMethodStartArray() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');

      List apiVal = jsonDecode(response.body);
       //------------------------------Without Model
       //   print('0 index user id: ' + apiVal[0]["title"].toString());

for (Map<String,dynamic> i in apiVal){
  httparrayListApiName.add(ArrayApi.fromJson(i));
  
  print("arry list of index id "+httparrayListApiName[0].title.toString());
}
    

     
    }
  }










  static dioMethodStartObject() async {
  

    var response = await Dio().get('https://reqres.in/api/users/2');


    
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.data}');

    

   
   ObjectApi objectApi= ObjectApi.fromJson(response.data);

      print('Data in id: ' + response.data["data"]["first_name"].toString());
      print('print with model Data in id: ' + objectApi.data!.email.toString());
    }
  }


 static List<ArrayApi>  dioarrayListApiName=[];
    static dioMethodStartArray() async {

       var response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
  
   
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.data}');

      List apiVal =response.data;
       //------------------------------Without Model
       //   print('0 index user id: ' + apiVal[0]["title"].toString());

for (Map<String,dynamic> i in apiVal){
  dioarrayListApiName.add(ArrayApi.fromJson(i));
  
  print("arry list of index id "+dioarrayListApiName[0].title.toString());
}
    

     
    }
  }




}
