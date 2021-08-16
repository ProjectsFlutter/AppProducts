import 'package:app_form_validation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.red,
        ),
      )
    );
  }
}