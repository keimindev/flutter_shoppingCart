import 'package:flutter/material.dart';
import 'package:flutter_shopping/view/mypage.dart';
import 'package:flutter_shopping/view/shopping_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageDirection(),
    );
  }
}

class PageDirection extends StatelessWidget {
  const PageDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(() => ShoppingPage());
          },
          child: const Text('쇼핑 카트'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(MyPageScreen());
          },
          child: const Text('뷰티 스토어'),
        ),
      ],
    );
  }
}
