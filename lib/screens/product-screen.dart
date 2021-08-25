import 'package:app_products/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(
         child: Column(
           children: [
             Stack(
                children: [
                  ProductImage()
                ],
             ),
           ],
           ),
         ),
       );
   }
 }