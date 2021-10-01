import 'package:app_products/screens/screens.dart';
import 'package:app_products/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(AppState());
 
 class AppState extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MultiProvider(
       providers:[
         ChangeNotifierProvider(create: (_) => ProductService())
       ],
       child: MyApp(),
     );
   }
 }
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      initialRoute: 'login',
      routes: {
       'home'     : (_) => HomeScreen(),
       'login'    : (_) => LoginScreen(),
       'register' : (_) => RegisterScreen(),
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