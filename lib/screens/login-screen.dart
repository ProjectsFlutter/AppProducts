import 'dart:ui';

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
              Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
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
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple
                  )
                ),
               focusedBorder: UnderlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.deepPurple,
                   width: 2
                 )
               ),
               hintText: 'alonso.jorgeluis@gmail.com',
               labelText: 'Correo electrónico',
               labelStyle: TextStyle(
                 color: Colors.grey
               ),
               prefixIcon: Icon(Icons.alternate_email_sharp,color: Colors.deepPurple),
              ),
            )
          ],
        )
      ),
    );
  }
}