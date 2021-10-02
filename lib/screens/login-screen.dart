import 'dart:ui';
import 'package:app_products/providers/login-provider.dart';
import 'package:app_products/services/services.dart';
import 'package:app_products/ui/inputDecorations-ui.dart';
import 'package:app_products/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 200.0),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox( height: 10.0),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30.0),
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginProvider(),
                      child: _LoginForm()
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed:() => Navigator.pushReplacementNamed(context,'register'), 
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())
                ),
                child: Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18.0, color: Colors.black87)),
              ),
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
    final loginForm = Provider.of<LoginProvider>(context);
    
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect:  false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hint_text: 'alonso.jorgeluis@gmail.com',
                label_text: 'Correo electrónico',
                prefix_icon:  Icons.alternate_email_rounded
              ),
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'Formato de correo incorrecto';
              },
              onChanged: (value) => loginForm.email = value,
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
              ),
              validator: (value){
                return (value != null && value.length >= 6) ? null : 'La contraseña debe de ser 6 caracteres';
              },
              onChanged: (value) => loginForm.password = value,
            ),
            SizedBox(height:10.0),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.purple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text(loginForm.isLoading ? 'Esperar' : 'Ingresar', style: TextStyle(color: Colors.white)),
              ),
              onPressed: loginForm.isLoading ? null : () async {
               FocusScope.of(context).unfocus();
               final authService = Provider.of<AuthService>(context, listen: false);

               if (!loginForm.isValidFrom()) return;
               loginForm.isLoading = true;

               final String? resp = await authService.login(loginForm.email, loginForm.password);
                if(resp==null){
                  Navigator.pushReplacementNamed(context, 'home');
                }else{
                  NotificationsService.showSnackbar(resp);
                  loginForm.isLoading = false;
                }
              },
            )
          ],
        )
      ),
    );
  }
}