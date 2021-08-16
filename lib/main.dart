import 'package:app_form_validation/screens/screens.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form validation',
      initialRoute: 'home',
      routes: {
       'home' : (_) => HomeScreen(),
       'login': (_) => LoginScreen()
      },
    );
  }
}