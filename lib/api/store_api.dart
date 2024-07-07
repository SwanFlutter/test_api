import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

Future<List<Product>?> fetchAllProducts() async {
  var basic64 =
      'Basic Y2tfMzdjYjMxY2U4Yjc5N2JhN2M3NTY0ZmRhYjVkMTM2NDc0MmMxM2RjNDpjc19jNzE2Mzc0MGViYzA1YmZiYzMwMWVhZDYzNjVhMWYzMGQ1ODcyNDUx';
  var response = await http.get(
      Uri.https(
        'myrestapii.liara.run',
        'wp-json/wc/v3/products',
      ),
      headers: {
        'Authorization': basic64,
        'Content-Type': 'application/json; charset=UTF-8'
      });

  if (response.statusCode == 200) {
    print(response.body);
    List<Product> mylistproduct = List<Product>.from(
        jsonDecode(response.body).map((x) => Product.fromMap(x)));
    return mylistproduct;
  } else {
    throw Exception('Failed to load products');
  }
}
