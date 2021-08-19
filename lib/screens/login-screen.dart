import 'package:app_form_validation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250.0),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox( height: 10.0),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30.0),
                    Text('Formulario')
                  ],
                ),
              )
          ],
         ),
        )
      )
    );
  }
}