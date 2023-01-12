import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web/controllers/test_counter_controller.dart';


class TestOtherScreen extends StatelessWidget{

  final TestCounterController _testCounterController = Get.find();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Screen was clicked ${_testCounterController.test.value} times"),
          SizedBox(height: 100,),
          ElevatedButton(onPressed: (){
            Get.back();
          }, child: Text("Open Other Screen"))
        ],
      ),

    );
  }
}
