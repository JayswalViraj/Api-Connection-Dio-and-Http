
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_api/models/posts.dart';
import 'package:dio_api/models/satrt_object_model.dart';
import 'package:dio_api/screens/api_error_page.dart';
import 'package:dio_api/screens/not_future_builder.dart';
import 'package:dio_api/utilities/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StartObjectFutureBuilder extends StatefulWidget {
  const StartObjectFutureBuilder({Key? key}) : super(key: key);

  @override
  State<StartObjectFutureBuilder> createState() => _StartObjectFutureBuilderState();
}

class _StartObjectFutureBuilderState extends State<StartObjectFutureBuilder> {
  

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
               FutureBuilder<StartObjectModel?>(
                future: ApiServices.callStartObjectApi(),
                builder: (context,AsyncSnapshot<StartObjectModel?> snapshot) {
                  if(snapshot.hasData){

                      return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Text("Using Future Buildr: "+snapshot.data!.data.lastName);
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
