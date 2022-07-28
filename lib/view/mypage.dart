import 'package:flutter/material.dart';
import 'package:flutter_shopping/view/product_tile.dart';
import 'package:get/get.dart';
import 'package:flutter_shopping/controller/store_controller.dart';

class MyPageScreen extends StatelessWidget {
  MyPageScreen({Key? key}) : super(key: key);

  //dependency injection
  final controller = Get.put(StoreController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty Store'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),

          //Obx는 grid view를 return 해줘야한다.
          child: Obx(
            () => GridView.builder(
              //grid size
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                //반복될 카드가 이미지와 텍스트를 이용하는 것이라서 그 타일 모양을 만들어주는게 좋다.
                return ProductTile(
                  controller.productList[index],
                );
              },
              itemCount: controller.productList.length,
            ),
          ),
        ),
      ),
    );
  }
}
