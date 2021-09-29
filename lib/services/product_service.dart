import 'package:app_products/models/models.dart';
import 'package:flutter/material.dart';

class ProductService extends ChangeNotifier{
  final String _baseUrl = "https://flutter-63eaf-default-rtdb.firebaseio.com";
  final List<Product> products = [];
  
}