import 'package:flutter/material.dart';
import 'package:flutter_shopping/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_shopping/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  //controller dependency
  //디펜던시 인젝션되면 다시 생성할 필요 없이 find를 사용해서 불러올 수 있다
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (contex, index) {
                  return Card(
                    margin: EdgeInsets.all(12),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24)),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text(
                                '\$${controller.products[index].price}',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addToItem(controller.products[index]);
                            },
                            child: Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(height: 30),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total Amount: \$ ${controller.totalPrice}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            );
          }),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            'item: ${controller.count}',
            style: TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.green,
      ),
    );
  }
}
