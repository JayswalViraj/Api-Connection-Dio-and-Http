import 'package:dio_api/utilities2/apicall.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DioHttp extends StatefulWidget {
  const DioHttp({Key? key}) : super(key: key);

  @override
  State<DioHttp> createState() => _DioHttpState();
}

class _DioHttpState extends State<DioHttp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {

                    ApiCall.dioMethodStartArray();

                  },
                  child: Text(
                    "Dio",
                    textScaleFactor: 2,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ApiCall.dioarrayListApiName.length,
                    itemBuilder: (context, index) => Text(index.toString()),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ApiCall.httpMethodStartArray();
                    
                  },
                  child: Text(
                    "Http",
                    textScaleFactor: 2,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ApiCall.httparrayListApiName.length,
                    itemBuilder: (context, index) => Text(index.toString()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
