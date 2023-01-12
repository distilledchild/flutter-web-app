import 'package:get/get.dart';



class TestCounterController extends GetxController {
  var test = 0.obs;

  void increment(){
    test++;
  }
}