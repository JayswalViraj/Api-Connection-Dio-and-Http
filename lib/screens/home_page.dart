import 'package:dio_api/screens/api_error_page.dart';
import 'package:dio_api/utilities/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(onTap: () async{
     ApiServices.getPost(context: context);
    
    
        },child: Text("hello")),
      ),
      
    );
  }
}