import 'dart:convert';

import 'package:app_products/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier{
  final String _baseUrl = "https://flutter-63eaf-default-rtdb.firebaseio.com";
  final List<Product> products = [];
  bool isLoading = true;

  ProductService(){
    this.loadProduct();
  }

  Future loadProduct()async{
    final url = Uri.https(this._baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });
  }
  
}