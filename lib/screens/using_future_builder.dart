import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_api/models/posts.dart';
import 'package:dio_api/screens/api_error_page.dart';
import 'package:dio_api/screens/not_future_builder.dart';
import 'package:dio_api/utilities/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsingFuturBuilder extends StatefulWidget {
  const UsingFuturBuilder({Key? key}) : super(key: key);

  @override
  State<UsingFuturBuilder> createState() => _UsingFuturBuilderState();
}

class _UsingFuturBuilderState extends State<UsingFuturBuilder> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return  NotFutureBuider();
          }));
        },
        label: const Text('Go to Not Future Builder'),
  
        backgroundColor: Colors.pink,
      ),
      body: Center(
          child:
               FutureBuilder<List<Posts>?>(
                future: ApiServices.callPostsApi(),
                builder: (context,AsyncSnapshot<List<Posts>?> snapshot) {
                  if(snapshot.hasData){

                      return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text("Using Future Buildr: "+snapshot.data![index].title.toString());
                      });

                  }
                  else{
                    return CircularProgressIndicator();
                  }

                
                }
              ),)
              
    );
  }




}
