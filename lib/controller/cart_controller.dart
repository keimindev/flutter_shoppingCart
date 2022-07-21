import 'package:get/get.dart';
import '../model/product.dart';

//샤로운 기능을 추가할 때마다 컨트롤로가 따로 추가 되어야한다.
class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
