import 'package:app_products/screens/screens.dart';
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
       'home'     : (_) => HomeScreen(),
       'login'    : (_) => LoginScreen(),
       'product'  : (_) => ProductScreen()
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color:  Colors.deepOrange
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: Colors.deepOrange
        )
      )
    );
  }
}