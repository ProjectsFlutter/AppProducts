import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';
  bool isValidFrom(){
    return formKey.currentState?.validate() ?? false;
  }
}