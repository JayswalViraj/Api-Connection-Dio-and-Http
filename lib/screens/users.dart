import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_api/models/posts.dart';
import 'package:dio_api/models/usersmodel.dart';
import 'package:dio_api/screens/api_error_page.dart';
import 'package:dio_api/screens/not_future_builder.dart';
import 'package:dio_api/utilities/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsingFuturBuilderUsers extends StatefulWidget {
  const UsingFuturBuilderUsers({Key? key}) : super(key: key);

  @override
  State<UsingFuturBuilderUsers> createState() => _UsingFuturBuilderUsersState();
}

class _UsingFuturBuilderUsersState extends State<UsingFuturBuilderUsers> {
  

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
               FutureBuilder<List<UsersModel>?>(
                future: ApiServices.callUsersApi(),
                builder: (context,AsyncSnapshot<List<UsersModel>?> snapshot) {
                  if(snapshot.hasData){

                      return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text("Complex data: "+snapshot.data![index].company.name);
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
