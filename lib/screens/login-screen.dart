import 'dart:ui';

import 'package:app_form_validation/ui/inputDecorations-ui.dart';
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
                    _LoginForm()
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 50.0),
          ],
         ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect:  false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hint_text: 'alonso.jorgeluis@gmail.com',
                label_text: 'Correo electrónico',
                prefix_icon:  Icons.alternate_email_rounded
              )
            ),
            SizedBox(height: 10.0),
            TextFormField(
              autocorrect:  false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hint_text: '******************',
                label_text: 'Contraseña',
                prefix_icon: Icons.lock_outline                
              )
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.purple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text('Ingresar', style: TextStyle(color: Colors.white)),
              ),
              onPressed: (){},
            )
          ],
        )
      ),
    );
  }
}