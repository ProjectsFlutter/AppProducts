import 'package:app_products/models/models.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Product product;
  
  ProductFormProvider(this.product);

  updateAvailability(bool value){
    this.product.available = value;
    notifyListeners();
  }
  
  bool isValidForm (){
    return formKey.currentState?.validate()?? false;
  }
}