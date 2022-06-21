import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_api/models/posts.dart';
import 'package:dio_api/screens/api_error_page.dart';
import 'package:dio_api/screens/using_future_builder.dart';
import 'package:dio_api/utilities/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotFutureBuider extends StatefulWidget {
  const NotFutureBuider({Key? key}) : super(key: key);

  @override
  State<NotFutureBuider> createState() => _NotFutureBuiderState();
}

class _NotFutureBuiderState extends State<NotFutureBuider> {
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataPosts();
  }

  getDataPosts() async {
   ApiServices.postsData = (await ApiServices.callPostsApi())!;
    if (ApiServices.postsData != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return  UsingFuturBuilder();
          }));
        },
        label: const Text('Go to With Future Builder'),
  
        backgroundColor: Colors.pink,
      ),
      body:  Center(
          child: isLoaded
              ? ListView.builder(
                  itemCount: ApiServices.postsData!.length,
                  itemBuilder: (context, index) {
                    return Text("With Not Future Builder : "+ApiServices.postsData![index].title);
                  })
              : CircularProgressIndicator()),
              
    );
  }

}
