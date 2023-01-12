import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/test_counter_controller.dart';
import 'package:get/get.dart';
import 'test_other.dart';

class TestHomeScreen extends StatelessWidget{

  final TestCounterController testCounterController = Get.put(TestCounterController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Obx(()=>Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Click: ${testCounterController.test.value}")),
            SizedBox(width: 20,),
            Center(
              child: ElevatedButton(onPressed: (){
                Get.to(TestOtherScreen());
              }, child: Text("Open other screen")),
            )
        ],
      ),),
        floatingActionButton: FloatingActionButton(onPressed: (){
          testCounterController.increment();
        },)

    );
  }
}
