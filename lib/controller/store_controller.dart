import 'package:get/get.dart';
import 'package:flutter_shopping/model/store.dart';
import 'package:flutter_shopping/data/services.dart';

class StoreController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  //fetch data method
  void fetchData() async {
    //return 되는 값 담는 변수 선언해주기
    var products = await Services.fetchProduct();
    if (products != null) {
      productList.value = products;
    }
  }
}
