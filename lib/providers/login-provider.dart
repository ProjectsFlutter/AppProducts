import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading; 
  set isLoading(bool value){
    this._isLoading = value;
    notifyListeners(); 
  }
  bool isValidFrom(){
    // print( formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  }
}