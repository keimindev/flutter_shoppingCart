import 'package:http/http.dart' as http;
import 'package:flutter_shopping/model/store.dart';

class Services {
  static var client = http.Client();

  //null 값때문에 ? 붙여주고 받아온 값 형태를 선언해준다.
  static Future<List<Product>?> fetchProduct() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      var jasonData = response.body;
      return productFromJson(jasonData);
    } else {
      return null;
    }
  }
}
